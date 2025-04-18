#!/usr/bin/env python3

import rospy
from std_msgs.msg import Int16

def callback(data):
    res = data.data + 5
    rospy.loginfo(f"Received {data.data}, final {res}")

def add():
    rospy.init_node('final')
    rospy.Subscriber('mul', Int16, callback)
    rospy.spin()

add()  

