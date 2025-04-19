#!/usr/bin/env python3

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def callback(data):
	bridge = CvBridge()
	image = bridge.imgmsg_to_cv2(data,desired_encoding='mono8')
	cv2.imshow("Edge Detected Image",image)
	cv2.waitKey(1)
	
def main():
	rospy.init_node('subscriber')
	rospy.Subscriber('Edge_Image',Image,callback)
	rospy.spin()
	cv2.destroyAllWindows()
	
main()
