#!/usr/bin/env python

import rospy
import sys, select, termios, tty
import multiprocessing
from std_msgs.msg import Int16MultiArray, Bool

instructions = """
Control Your Robot!
---------------------------
f -> forwards
b -> backwards
l -> turn left
r -> turn right
s -> stop the robot/ s again start the robot
a -> faster

q to quit
"""


def getKey():
    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''

    return key


class Keyboard_steering:
    def __init__(self):
        self.speed = 20

    def run_teleop(self):
        """
        De steeringArray is als volgt opgevuld:
            _________________________________
           |               |                 |
           | forward left  |  forward right  |
            ---------------------------------
            Waarbij de waarde -1 is indien ze niet van toepassing is
        """
        print(instructions)

        steering_array = Int16MultiArray()
        steering_array.data = [0, 0]
        current_stop = False

        pub_steering = rospy.Publisher("steering_topic", Int16MultiArray, queue_size=10)
        # pub_stop = rospy.Publisher("stop_topic", Bool, queue_size=10)

        key = getKey()
        while key != 'q' or rospy.is_shutdown():
            if key:
                if key == 's':
                    current_stop = True
                    steering_array.data = [0, 0]
                    pub_steering.publish(steering_array)
                else:
                    current_stop = False

                if not current_stop:
                    if key == 'f':
                        steering_array.data[0] = self.speed
                        steering_array.data[1] = self.speed
                    elif key == 'b':
                        steering_array.data[0] = -self.speed
                        steering_array.data[1] = -self.speed
                    elif key == 'l':
                        steering_array.data[0] = 0
                        steering_array.data[1] = self.speed
                    elif key == 'r':
                        steering_array.data[0] = self.speed
                        steering_array.data[1] = 0
                    elif key == 'a':
                        if self.speed < 260:
                            self.speed += 40
                        else:
                            self.speed = 20

                    pub_steering.publish(steering_array)

            key = getKey()

        rospy.loginfo("Shutting down")
        for process in multiprocessing.active_children():
            rospy.loginfo("Shutting down process %r", process)
            process.terminate()
            process.join()
        rospy.loginfo("All done")


if __name__=="__main__":
    rospy.init_node("keyboard_steering", disable_signals=True)
    ks = Keyboard_steering()
    try:
        ks.run_teleop()
    except rospy.ROSInterruptException:
        pass
