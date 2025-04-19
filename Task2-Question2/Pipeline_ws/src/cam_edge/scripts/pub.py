#! /usr/bin/env python3

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def main():
	rospy.init_node('publisher')
	pub = rospy.Publisher('Edge_Image',Image,queue_size = 5)
	bridge = CvBridge()
	cap = cv2.VideoCapture(0)
	
	if not cap.isOpened():
		rospy.loginfo('Camera not opened')
		return
	rate = rospy.Rate(1)
	
	while not rospy.is_shutdown():
		has_frame,frame = cap.read()
		if not has_frame:
			rospy.loginfo('No frame')
			continue
		gray_scale = cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
		edges = cv2.Canny(gray_scale,145,150)
		
		image = bridge.cv2_to_imgmsg(edges,encoding="mono8")
		pub.publish(image)
		rate.sleep()
	cap.release()
main()
			
		
