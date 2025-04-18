#!/usr/bin/env python3

import rospy
from std_msgs.msg import Int16

def publisher():
	pub = rospy.Publisher('multiplesof2',Int16,queue_size=1)
	rospy.init_node('pub_node')
	rate = rospy.Rate(1)
	i = 2
	
	while not rospy.is_shutdown():
		rospy.loginfo(f"Publishing :{i}")
		pub.publish(i)
		i += 2
		rate.sleep()
publisher()
