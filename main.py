# This is a sample Python script.
import telegram
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

# connecting and building the session
client.connect()

URL = "http://localhost:8080/api/getMessage?type=2"


def _telegrambot():
    if not client.is_user_authorized():
        client.send_code_request(phone)
        client.sign_in(phone, input('Enter the code: '))
    try:
        bot = Bot(token)
        bot.send_message(-959717704, 'test')
    except Exception as e:
        print(e);

# Press the green button in the gutter to run the script.
async def send(msg):
    r = requests.get(url=URL)
    r = r.json();
    bot = telegram.Bot(token=token)
    if (r['message'] == ''):
        msg = 'No data'
    else:
        msg = r['message']
    await bot.sendMessage(chat_id=-959717704, text=msg)
    print('Message Sent!')


if __name__ == '__main__':
    try:
        asyncio.run(send(msg='Đặt cơm'))
    except requests.exceptions.RequestException as e:  # This is the correct syntax
        print(str(e))


# schedule.every(5).seconds.do(chat_to_user)
def run():
    asyncio.run(send(msg='Đặt cơm'))


schedule.every().day.at("10:45").do(run)
while True:
    schedule.run_pending()
    time.sleep(1)
