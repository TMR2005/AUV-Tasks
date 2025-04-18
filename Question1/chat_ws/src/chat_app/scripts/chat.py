#!/usr/bin/env python3
import rospy
from chat_app.msg import ChatMsg  # Correct import path
import threading
username =""
# Move the username input to the start
def get_username():
    global username
    while not username:
        username = input("Enter your username: ").strip()
    print(f"Welcome, {username}!")

def callback(data):
    if data.username != username:
        rospy.loginfo(f"{data.username}: {data.message}")

def listener():
    rospy.Subscriber("topic", ChatMsg, callback)
    rospy.spin()

def talker():
    pub = rospy.Publisher("topic", ChatMsg, queue_size=5)
    rospy.init_node("chat_node_" + username, anonymous=True)
    rate = rospy.Rate(5)

    # Start listener in a separate thread
    threading.Thread(target=listener, daemon=True).start()
    
    while not rospy.is_shutdown():
        msg_input = input(f"{username}, type your message: ")
        
        if msg_input.lower() == "quit":
            print(f"{username} left")
            rospy.signal_shutdown("User quit")
            break
        
        msg = ChatMsg()
        msg.username = username
        msg.message = msg_input
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    get_username()  # Prompt for the username first
    talker()

