#!/usr/bin/env python3

import rospy
from std_msgs.msg import Int16

def callback(data):
    mul = data.data * 10
    rospy.loginfo(f"Received {data.data}, publishing {mul}")
    pub.publish(mul)

def multiplier():
    global pub
    rospy.init_node('mul_node')
    pub = rospy.Publisher('mul', Int16, queue_size=1)
    rospy.Subscriber('multiplesof2', Int16, callback)
    rospy.spin()

multiplier()

