import json

from selenium import webdriver
import requests
from selenium.webdriver.common.by import By
import undetected_chromedriver as uc
import schedule
import time
from datetime import datetime
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

BASE_API = 'https://dat-com.site/api';
API_REFRESH = 'https://identity-tcb.techcombank.com.vn/auth/realms/backbase/protocol/openid-connect/token'
API_TECH = (
    "https://onlinebanking.techcombank.com.vn/api/transaction-manager/client-api/v2/transactions?from=0&size=20");

username = '0985574580'
password = 'Vui@231020'
opts = uc.ChromeOptions()
opts.add_argument('--no-sandbox')
opts.add_argument('--headless')
opts.add_argument('--disable-dev-shm-usage')
opts.set_capability('goog:loggingPrefs', {'performance': 'ALL'})
def _refreshToken(token):
    try:
        print('REFRESH TOKEN');
        data = {
            'grant_type': 'refresh_token',
            'scope': 'openid',
            'refresh_token': token,
            'client_id': 'tcb-web-client',
            'ui_locales': 'vi',
        };
        headers = {'Content-Type': 'application/x-www-form-urlencoded'}
        r = requests.post(url=API_REFRESH, data=data, headers=headers);
        if r.status_code == 200:
            print('REFRESH TOKEN THÀNH CÔNG');
            data = r.json();
            # Cập nhật token refresh
            r = requests.get(url=BASE_API + '/updateRefreshToken?token=' + data['refresh_token']);
            # Cập nhật token
            requests.get(url=BASE_API + '/updateToken?token=' + data['access_token']);
            print(r.json())
        else:
            print('REFRESH TOKEN THẤT BẠI');
            print(r.json())
    except requests.exceptions.RequestException as e:  # This is the correct syntax
        print(str(e))
def process_browser_log_entry(entry):
    response = json.loads(entry['message'])['message']
    return response

def _login_bank():
    driver = webdriver.Chrome(options=opts, service=Service(ChromeDriverManager().install()))
    driver.get(
        'https://identity-tcb.techcombank.com.vn/auth/realms/backbase/protocol/openid-connect/auth?response_type=code&client_id=tcb-web-client&state=V0hFfm55d3RUQ3NRcmlqaGFnUWVwRjR4RTIzckpuVnVEMWFZcF8xNXkwTEt4&redirect_uri=https%3A%2F%2Fonlinebanking.techcombank.com.vn%2Fredirect&scope=openid&code_challenge=8qW97nK9Hh8nJ-ryzRH17WiYZ4RvOapCoe3t_TEacgc&code_challenge_method=S256&nonce=V0hFfm55d3RUQ3NRcmlqaGFnUWVwRjR4RTIzckpuVnVEMWFZcF8xNXkwTEt4&ui_locales=en-US')
    isRun = True;
    while True:
        try:
            if isRun is True:
                eUname = driver.find_element(by=By.CSS_SELECTOR, value="#username")
                ePass = driver.find_element(by=By.CSS_SELECTOR, value="#password")
                ePass.send_keys(password)
                eUname.send_keys(username)
                signin_btn = driver.find_element(by=By.CSS_SELECTOR, value="#kc-login")
                signin_btn.click()
                driver.implicitly_wait(10)
            else:
                _get_token(driver)
                break
        except Exception as e:
            if (driver.current_url.__contains__('https://onlinebanking.techcombank.com.vn/dashboard')):
                isRun = False;
def _get_token(driver):
    logs = driver.get_log('performance')
    token = ''
    for log in logs:
        message = json.loads(log["message"])["message"]
        if ("Network.response" in message["method"]
                or "Network.request" in message["method"]
                or "Network.webSocket" in message["method"]):
            if str(message).__contains__('\'params\''):
                params = message['params']
                if str(params).__contains__('\'request\''):
                    request = params['request']
                    if str(request).__contains__('\'url\''):
                        r = request['url']
                        if request['url'].__contains__('https://identity-tcb.techcombank.com.vn/auth/realms/backbase/protocol/openid-connect/token'):
                            r = json.dumps(message)
                            postData = request['postData'];
                            if postData.__contains__('refresh_token'):
                                datas = postData.split("&")
                                for data in datas:
                                    if(data.__contains__('refresh_token=')) is True:
                                        token = str(data).replace('refresh_token=','')
                                        break
    if token != '':
        _refreshToken(token=token)
def _history():
    try:
        r = requests.get(url=BASE_API+'/getToken');
        if r.status_code == 200:
            data = r.json();
            token =data['data'];
            # param = '';
            yesterday = datetime.now() # - timedelta(1)
            yesterday = yesterday.strftime('%Y-%m-%d');
            today = datetime.now().strftime('%Y-%m-%d');
            # paramAll = '&bookingDateGreaterThan=2023-07-27&bookingDateLessThan=2023-08-27'
            param = '&bookingDateGreaterThan=' + yesterday + '&bookingDateLessThan=' + today
            r = requests.get(url=API_TECH + param,
                             headers={
                                 'Authorization': 'Bearer {}'.format(token)}
                             );
            datas = r.json();
            if r.status_code == 200:
                lst = []
                for d in datas:
                    lst.append(d['description'])
                print(json.dumps(lst))
                body = json.dumps(lst);
                body = str(body);
                body = json.loads(body)
                requests.post(url=BASE_API+'/order/updateTransaction', json=body, headers={"Content-Type": "application/json; charset=utf-8"})
            else:
                _login_bank()
    except requests.exceptions.RequestException as e:
        print(str(e))


schedule.every(5).seconds.do(_history)
while True:
    schedule.run_pending()
    time.sleep(1)