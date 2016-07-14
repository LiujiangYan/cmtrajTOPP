import rospy
import numpy
from std.msgs.msg import *

def talker(jointVariable, time):
	pubJoint1 = rospy.Publisher('／lir3/joint1_position_controller/command', float64)
	pubJoint2 = rospy.Publisher('／lir3/joint2_position_controller/command', float64)
	pubJoint3 = rospy.Publisher('／lir3/joint3_position_controller/command', float64)
	pubJoint4 = rospy.Publisher('／lir3/joint4_position_controller/command', float64)
	pubJoint5 = rospy.Publisher('／lir3/joint5_position_controller/command', float64)
	pubJoint5 = rospy.Publisher('／lir3/joint6_position_controller/command', float64)
	rospy.init_node('talker', anonymous=True)
	rate = rospy.Rate(100)
	i = 0
	while not rospy.is_shutdown():
		if i<len(time):
			pubJoint1.publish(jointVariable[i,1])
			pubJoint2.publish(jointVariable[i,2])
			pubJoint3.publish(jointVariable[i,3])
			pubJoint4.publish(jointVariable[i,4])
			pubJoint5.publish(jointVariable[i,5])
			pubJoint6.publish(jointVariable[i,6])
			i += 1
		rate.sleep

if __name__ = '__main__':
	try:
		jointVariable = numpy.loadtxt(open("jointVariable.csv","rb"), delimiter=",",skiprows=0)
		time = numpy.loadtxt(open("time.csv","rb"), delimiter=",",skiprows=0)
		talker(jointVariable, time)
	except rospy.ROSInterruptException:
		pass