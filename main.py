# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
from skpy import Skype, SkypeChats
import requests
import schedule
import time
URL = "http://localhost:8080/api/getMessage?type=2"

def chat_to_user():
    print('Chat 1p')
    slogin = Skype("sanvankhanh@gmail.com", "Vui@23102000");
    contact = slogin.contacts['live:.cid.44d685e75e2477a5'];
    contact.chat.sendMsg('Em test gửi tin nhắn 1p 1 lần nha')
def chat_to_sky(msg):
    slogin = Skype("sanvankhanh@gmail.com", "Vui@23102000");
    channel = slogin.chats.chat('19:6cfc52db634148c49c1929ad0de36681@thread.skype') #Gửi tn chốt cơm
    channel.sendMsg(msg)
    skc = SkypeChats(slogin)
    print(skc.recent())
    contact = slogin.contacts['live:.cid.44d685e75e2477a5'];
    # for i in range(1, 11):
    #     contact.chat.sendMsg('Test send message '+str(i))
def run():
    # Use a breakpoint in the code line below to debug your script.
    r = requests.get(url=URL)
    r = r.json();
    print(r['message'])
#    chat_to_sky(msg=r['message'])


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    run();

schedule.every().day.at("20:51").do(run)
schedule.every(1).minutes.do(chat_to_user)

while True:
    # Checks whether a scheduled task
    # is pending to run or not
    schedule.run_pending()
    time.sleep(1)