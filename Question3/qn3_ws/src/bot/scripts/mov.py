#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from bot.msg import BotPose
from statemachine import StateMachine, State

class BotSM(StateMachine):
    idle = State("Idle", initial=True)
    moving = State("Moving")
    turning = State("Turning")

    move = idle.to(moving) | turning.to(moving) | moving.to(moving)
    turn = moving.to(turning) | turning.to(turning)
    stop = moving.to(idle)

class Bot:
    def __init__(self):
        self.state = BotSM()
        self.x = 0
        self.y = 0
        self.directions = ["North", "East", "South", "West"]
        self.dir_index = 0  # Facing North initially

        self.pub = rospy.Publisher("bot_pose", BotPose, queue_size=10)
        rospy.Subscriber("bot_command", String, self.command_callback)

    def command_callback(self, msg):
        cmd = msg.data.lower()

        if cmd == "forward":
            self.state.move()
            if self.directions[self.dir_index] == "North":
                self.y += 1
            elif self.directions[self.dir_index] == "East":
                self.x += 1
            elif self.directions[self.dir_index] == "South":
                self.y -= 1
            elif self.directions[self.dir_index] == "West":
                self.x -= 1
            rospy.loginfo(f"Moved forward. New position: ({self.x}, {self.y})")

        elif cmd == "left":
            self.state.turn()
            self.dir_index = (self.dir_index - 1) % 4
            rospy.loginfo(f"Turned left. Now facing {self.directions[self.dir_index]}")

        elif cmd == "right":
            self.state.turn()
            self.dir_index = (self.dir_index + 1) % 4
            rospy.loginfo(f"Turned right. Now facing {self.directions[self.dir_index]}")

        elif cmd == "stop":
            self.state.stop()
            rospy.loginfo("Bot stopped.")

        pose = BotPose()
        pose.x = float(self.x)
        pose.y = float(self.y)
        pose.direction = self.directions[self.dir_index]
        self.pub.publish(pose)

def run_bot():
    rospy.init_node('bot_controller', anonymous=True)
    bot = Bot()
    rospy.spin()

run_bot()

