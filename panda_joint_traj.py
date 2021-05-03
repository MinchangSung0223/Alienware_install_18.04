import rospy
import actionlib
from control_msgs.msg import *
from trajectory_msgs.msg import *
import sys
import copy
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from math import pi
from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list


JOINT_NAMES=["panda_joint1","panda_joint2","panda_joint3","panda_joint4","panda_joint5","panda_joint6","panda_joint7"]
Q1 = [0.0,0,0.0,0,0,0,0.5]
Q2 = [0.0,0,0.0,0,0,0,0.7]

client=None;
def move1():
	g = FollowJointTrajectoryGoal()
	g.trajectory = JointTrajectory()
	g.trajectory.joint_names = JOINT_NAMES
	g.trajectory.points = [JointTrajectoryPoint(positions=Q1,velocities=[0]*6,time_from_start=rospy.Duration(2.0)),JointTrajectoryPoint(positions=Q2,velocities=[0]*6,time_from_start=rospy.Duration(3.0))]
	client.send_goal(g)
	try:
		client.wait_for_result()
	except KeyboardInterrupt:
		client.cancel_goal()
		raise
def main():
	global client
	try:
		moveit_commander.roscpp_initialize(sys.argv)
		rospy.init_node('move_group_python_interface_tutorial',anonymous=True)
		robot = moveit_commander.RobotCommander()
		scene = moveit_commander.PlanningSceneInterface()	
		group_name = "panda_arm"
		group = moveit_commander.MoveGroupCommander(group_name)
		display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',
                                                   moveit_msgs.msg.DisplayTrajectory,
                                                   queue_size=20)
		planning_frame = group.get_planning_frame()
		planning_frame = group.get_planning_frame()
		group_names = robot.get_group_names()

		client=actionlib.SimpleActionClient("follow_joint_trajectory",FollowJointTrajectoryAction)
		print("Waiting for server")
		client.wait_for_server()
		print("Connected to server")
		move1()
	except KeyboardInterrupt:
		rospy.signal_shutdown("KeyboardInterrupt")
		raise
if __name__=="__main__":main()


