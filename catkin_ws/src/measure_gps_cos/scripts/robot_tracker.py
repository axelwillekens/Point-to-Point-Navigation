#!/usr/bin/env python

import rospy
from datetime import datetime
from sensor_msgs.msg import NavSatFix, NavSatStatus, TimeReference
from SimpleWebSocketServer import SimpleWebSocketServer, WebSocket

try:
    import thread
except ImportError:
    import _thread as thread
import time


class WaypointCreator:
    def __init__(self, websocket):
        self.filename = 'waypoints{}_{}.txt'.format(str(datetime.now().date()), str(datetime.now().time()))
        self.waypointfile = open(self.filename, 'w+')
        self.websocket = websocket
        rospy.Subscriber('fix', NavSatFix, self.gnssCalback)
        rospy.loginfo("initialization done")

    def start(self):
        rospy.spin()

    def stop(self):
        self.filename.close()

    def gnssCalback(self, msg):
        s = "{},{},{}\n".format(msg.latitude, msg.longitude, msg.header.stamp)
        self.waypointfile.write(s)
        self.websocket.sendMessage(s)
        rospy.loginfo("writed: {} to file {}".format(s.rstrip('\n'), self.filename))


class SimpleEcho(WebSocket):
    def handleMessage(self):
        # echo message back to client
        self.sendMessage(self.data)

    def handleConnected(self):
        print(self.address, 'connected')
        self.wa = WaypointCreator(self)

        def run(*args):
            print("thread started...")
            args[0].wa.start()

        thread.start_new_thread(run, (self,))

    def handleClose(self):
        print(self.address, 'closed')
        self.wa.stop()


if __name__ == "__main__":
    rospy.init_node("measure_gps_cos", disable_signals=True)
    rospy.loginfo("RobotTracker takes of!! Make connetion to start!!")
    server = SimpleWebSocketServer('', 8000, SimpleEcho)
    server.serveforever()

