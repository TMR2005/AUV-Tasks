#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

def publisher():
    rospy.init_node('pub')
    pub = rospy.Publisher('bot_command', String, queue_size=5)
    rate = rospy.Rate(1)
    print("Enter-> 1.Forward 2.Turn Left 3.Turn Right 4.Stop 5.Exit")

    while not rospy.is_shutdown():
        cmd = input("Enter command: ")

        if cmd == '5':
            print("Exiting...")
            break
        elif cmd == '1':
            pub.publish('forward')
        elif cmd == '2':
            pub.publish('left')
        elif cmd == '3':
            pub.publish('right')
        elif cmd == '4':
            pub.publish('stop')
        else:
            print("Invalid input. Please enter a number between 1-5.")
        
        rate.sleep()

publisher()

