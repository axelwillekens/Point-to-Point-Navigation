#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from std_msgs.msg import Int16MultiArray, String, Bool


def speed_to_dac(v):
    if v > 0:
        ret = 421.3 * v - 71.43
        if ret > 300:
            ret = 300
    else:
        ret = 0
        
    rospy.loginfo("dac speed = {}".format(int(ret)))
    return int(ret)


def adc_to_speed(adc_val):
    v = 6.963e-6 * adc_val**2 - 0.009754 * adc_val + 3.847
    if 0.5 <= v <= 0.8:
        return v
    else:
        return None


def calc_wheel_vel(vx, dYAW, wielbasis):
    """
    methode om de wielsnelheden te berekenen
    :param vX: X snelheid in groot assenstelsel
    :param vY: Y snelheid in groot assenstelsel
    :param vYAW: d(YAW)/dt in groot assenstelsel
    :param wielbasis: de breedte van de wagen (hangt of van de instelbare pomp)
    :return: Int16MultiArray message -> te publishen op steering_topic
    """
    if dYAW == 0:
        vl = vx
        vr = vx
    else:
        R = vx/dYAW
        a = wielbasis / 2
        vl = 2 * vx / (((R + a) / (R - a)) + 1)
        vr = 2 * vx / (((R - a) / (R + a)) + 1)
        # rospy.loginfo("L: {} R: {}".format(vl, vr))
    rospy.loginfo("vl = %f, vr = %f", vl, vr);
    return [speed_to_dac(vl), speed_to_dac(vr)]


class Drive_controller:
    def __init__(self, wielbasis):
        self.wielbasis = float(wielbasis)
        # steering data publisher aanmaken voor het controleren van de arduino
        self.steering_pub = rospy.Publisher('steering_topic', Int16MultiArray, queue_size=10)
        self.steering_msg = Int16MultiArray()
        self.steering_msg.data = [0, 0]

        self.stop = False

        # aanmaken subscibers
        rospy.Subscriber("cmd_vel", Twist, self.cmdCallback)
        rospy.Subscriber("stop_topic", String, self.stopCallback)

    def run(self):
        rospy.spin()

    def stopCallback(self, stopmsg):
        self.stop = stopmsg.data
        if stopmsg.data:
            self.steering_msg.data = [0, 0]

        self.steering_pub.publish(self.steering_msg)

    def cmdCallback(self, twistmsg):
        """
        Parameters zijn allemaal gerefereerd t.o.v het grote assenstelsel
            -> X wijst naar het oosten
            -> Y wijst naar het noorden
        :param twistmsg:
            - Vector3 linear    * x -> vX
                                * y -> vY
                                * z -> vZ (=0 in onze toepassing)
            - Vector3 angular   * x -> d(ROLL)/dt (=0 in onze toepassing)
                                * y -> d(PITCH)/dt (=0 in onze toepassing)
                                * z -> d(YAW)/dt
        :return: -> aansturen van robot
        """
        vx = twistmsg.linear.x
        vyaw = twistmsg.angular.z

        if not self.stop:
            msg = calc_wheel_vel(vx, vyaw, self.wielbasis)

            if msg:
                self.steering_msg.data = msg
                self.steering_pub.publish(self.steering_msg)


if __name__ == "__main__":
    # Initialize our ros node
    rospy.init_node('drive_controller', disable_signals=True)
    wielbasis = rospy.get_param('~wielbasis', '46')

    dc = Drive_controller(wielbasis)
    dc.run()
