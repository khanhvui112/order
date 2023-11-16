# This is a sample Python script.
import json

import telegram
from requests.auth import HTTPBasicAuth
from telegram import Bot
from telethon import TelegramClient, sync, events
import asyncio
import requests
import schedule
import time

api_id = '28744749'
api_hash = '95060a25785ed69877aae85647d2721b'
token = '6147813580:AAFIk_mSvZ-Aubwuevcrf0UftWemU1AsFFM'
message = "Working..."
phone = '+84985574580'
client = TelegramClient('session', api_id, api_hash)
BASE_API = 'https://dat-com.site/api';
# BASE_API = 'http://localhost:8081/api';
API_REFRESH = 'https://identity-tcb.techcombank.com.vn/auth/realms/backbase/protocol/openid-connect/token'
API_TECH = (
    "https://onlinebanking.techcombank.com.vn/api/transaction-manager/client-api/v2/transactions?from=0&size=20");
API_SEND_SMS = 'https://api.twilio.com/2010-04-01/Accounts/:AccountSid/Messages.json?From=+84985574580'
# connecting and building the session
client.connect()
URL = BASE_API+"/getMessage?type=2"
from datetime import datetime
from twilio.rest import Client

async def sendMsgToTele(msg):
    try:
        bot = telegram.Bot(token=token)
        await bot.sendMessage(chat_id=-959717704, text=msg)
    except Exception as e:
        print(e)
def _sendSMS(msg):
    try:
        r = requests.get(url=BASE_API + '/getTokenSendSMS');
        if r.status_code == 200:
            data = r.json();
            auth_token = data['data'];
            account_sid = 'AC3893ee1c2c6e348f3fca2886ee53d0c9'
            client = Client(account_sid, auth_token)
            totalStr:int = msg.rfind('\n');
            str = msg[totalStr:];
            total = str.replace('\nTổng: ','')
            msg = '\n\nCô ơi cho cháu '+total+'s tầng 16 ạ\n'+msg;
            r = requests.get(url=BASE_API + '/getToPhone');
            data = r.json();
            phone = data['data'];
            message = client.messages.create(
                body=msg,
                from_='+13367925013',
                to=phone
            )
            msg = 'Robot đã đặt cơm'+msg;
            asyncio.run(sendMsgToTele(msg=msg))
    except Exception as e:
        asyncio.run(sendMsgToTele(msg='Robot gửi tin nhắn đặt cơm thất bại'))
        print(e)
def _telegrambot():
    if not client.is_user_authorized():
        client.send_code_request(phone)
        client.sign_in(phone, input('Enter the code: '))
    try:
        bot = Bot(token)
        # bot.send_message(-959717704, 'test')
    except Exception as e:
        print(e);

# Press the green button in the gutter to run the script.
def send():
    r = requests.get(url=URL)
    r = r.json();
    if (r['message'] == ''):
        msg = 'No data'
    else:
        msg = r['message']
        _sendSMS(msg);
    # await bot.sendMessage(chat_id=-959717704, text=msg)
    # print('Message Sent!')


if __name__ == '__main__':
    try:
        send()
    except requests.exceptions.RequestException as e:  # This is the correct syntax
        print(str(e))


# schedule.every(5).seconds.do(chat_to_user)
# def run():
    # asyncio.run(send(msg='Đặt cơm'))
def _lastUpdate():
    try:
        r = requests.get(url=BASE_API+'/lastUpdateRefreshToken');
        if r.status_code == 200:
            data = r.json();
            updateTime = data['code'];
            # 1700023200000
            nextUpdate = updateTime + (60 * 4 * 1000)+(30*1000);
            current_time_millis = int(round(time.time() * 1000))
            if(current_time_millis >= nextUpdate):
                _refreshToken();
                print('Update TOKEN')
            else:
                print('Chưa update được: '+str(nextUpdate))
            print(current_time_millis);
    except requests.exceptions.RequestException as e:  # This is the correct syntax
        print(str(e))
def _refreshToken():
    try:
        r = requests.get(url=BASE_API+'/getRefreshToken');
        if r.status_code == 200:
            data = r.json();
            token =data['data'];
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
                _history()
                print(r.json())
            else:
                print('REFRESH TOKEN THẤT BẠI');
                print(r.json())
    except requests.exceptions.RequestException as e:  # This is the correct syntax
        print(str(e))

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
            print(param)
            r = requests.get(url=API_TECH + param,
                             headers={
                                 'Authorization': 'Bearer {}'.format(token)}
                             );
            datas = r.json();
            if r.status_code == 200:
                print(datas)
                lst = []
                for d in datas:
                    lst.append(d['description'])
                print(json.dumps(lst))
                body = json.dumps(lst);
                body = str(body);
                body = json.loads(body)
                call = requests.post(url=BASE_API+'/order/updateTransaction', json=body, headers={"Content-Type": "application/json; charset=utf-8"})
                print(call)
            else:
                print('Lỗi r')
    except requests.exceptions.RequestException as e:
        print(str(e))
schedule.every(20).seconds.do(_lastUpdate)
schedule.every(30).seconds.do(_history)
schedule.every().day.at("10:50").do(send)
# schedule.every(20).seconds.do(send)
while True:
    schedule.run_pending()
    time.sleep(1)
