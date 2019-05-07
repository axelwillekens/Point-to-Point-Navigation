#!/usr/bin/env python3

import json
import numpy as np
from SimpleWebSocketServer import SimpleWebSocketServer, WebSocket
import math
import time


def calcParallel(line, point, distance):
    """
    Used formula: d(P,l) = |a*x1+b*y1+c|/(a**2 + b**2)**(1/2)
    whereby: P(x1,y1) and l: y = m*x + q => 0 = m*x - y + q
    with:   d(P,l)  -> the distance between the point on the line and the parallel
            a       -> the rico of the parallel (= the m of the line)
            b       -> -1
            c       -> ?
    :param line: equation of the line of the form y = m*x + q
    :param point: point on the line
    :param distance: distence between line and his parallel
    :return: equation of the parallel of the line
    """
    x1 = point[0]
    y1 = point[1]

    a = line["m"]
    b = -1
    c = math.sqrt((distance**2) * (a**2 + b**2)) - a*x1 - b*y1

    return {"m": a, "q": c}


def calcIntersect(line1, line2):
    """
    :param line1: equation of the line of the form y = m*x + q
    :param line2: equation of the line of the form y = m*x + q
    :return: coordinate [x_int, y_int] of the intersection
    """
    m1 = line1['m']
    q1 = line1['q']
    m2 = line2['m']
    q2 = line2['q']

    x_int = (q2 - q1)/(m1 - m2)
    y_int = m1 * x_int + q1

    return [x_int, y_int]


def calcEquation(point1, point2):
    x1 = point1[0]
    y1 = point1[1]
    x2 = point2[0]
    y2 = point2[1]

    r = ((y2 - y1) / (x2 - x1))
    return {"m": r, "q": -r*x1 + y1}


def calcDistance(point1, point2):
    x1 = point1[0]
    y1 = point1[1]
    x2 = point2[0]
    y2 = point2[1]
    print("point1: (x1={}, y1={}), point2: (x2={}, y2={})".format(x1, y1, x2, y2))

    return math.sqrt((x1 - x2)**2 + (y1 - y2)**2)


def calcNextPoint(point, toGoPoint, distance):
    """
    Calculates te next point by solving the following system:
         _
         |
         |  d(P1,P2)**2 = (x1-x2)**2 + (y1-y2)**2
        <
         |  y2 = a*x2 + b
         |_
        known: d(P1,P2) -> distance;
                x1 -> point[0]; y1 -> point[1];
                a -> line['m'] point:toGoPoint; b -> line['q'] point:toGoPoint
        unknown:    x2, y2
    :param point: 
    :param toGoPoint: 
    :param distance: distance between points
    :return: the next point
    """
    d = distance
    line = calcEquation(point, toGoPoint)
    a = line['m']
    b = line['q']
    print("a: {}, b: {}".format(a, b))
    x1 = point[0]
    y1 = point[1]
    
    coeff = [1 + a**2, -2*x1 + 2*a*b - 2*y1*a, x1**2 - d**2 - 2*y1*b + y1**2 + b**2]
    # problems for small values of distance, roots are complex then
    res = np.roots(coeff)
    co1 = [res[0], a*res[0] + b]
    co2 = [res[1], a * res[1] + b]

    d_ref = calcDistance(point, toGoPoint)
    d_1 = calcDistance(co1, toGoPoint)
    d_2 = calcDistance(co2, toGoPoint)
    if d_1 < d_2:
        if calcDistance(point, co1) < d_ref and d_1 >= distance:
            return co1
    else:
        if calcDistance(point, co2) < d_ref and d_2 >= distance:
            return co2


def calcNextPointsArray(point, toGoPoint, distance):
    ret = []
    currentpoint = point

    while currentpoint:
        ret.append(currentpoint)
        currentpoint = calcNextPoint(currentpoint, toGoPoint, distance)

    return ret


def orderCornerpoints(points):
    """
    Het is van belang dat de eerste hoekpunt het meest links licht!
    :param points:
    :return: ordered points
    """
    for i in range(4):
        if points[i][0] < points[(i+1) % 4][0]:
            points = points[i:] + points[:i]

    return points


class PointCalulator:
    def __init__(self, cornerpoints, row_width, distance_width):
        self.row_width = row_width
        self.distance_width = distance_width
        self.cornerpoints = orderCornerpoints(cornerpoints)
        self.line_equations = self.calcLineEquations()

    def calcLineEquations(self):
        """
        ret contains equations of the form y = m*x + q or 0 = -y + m*x + q
        :return: array of equations of the above form
        """
        ret = []
        for i in range(len(self.cornerpoints)):
            ret.append(calcEquation(self.cornerpoints[i], self.cornerpoints[(i+1) % 4]))

        return ret

    def calcContourPoints(self):
        cnt = 0     # teller bijgehouden voor de bochten
        contourpoints = self.cornerpoints[:2]
        current_line = self.line_equations[0]
        current_above_point = contourpoints[0]
        last_above_point = self.cornerpoints[3]

        while current_above_point[0] < last_above_point[0]:
            current_line = calcParallel(current_line, contourpoints[len(contourpoints)-1], self.row_width)

            if cnt % 2 == 0:
                contourpoints.append(calcIntersect(current_line, self.line_equations[1]))
                current_above_point = calcIntersect(current_line, self.line_equations[3])
                contourpoints.append(current_above_point)
            else:
                current_above_point = calcIntersect(current_line, self.line_equations[3])
                contourpoints.append(current_above_point)
                contourpoints.append(calcIntersect(current_line, self.line_equations[1]))

            cnt += 1

        return contourpoints

    def calcAllpoints(self):
        contourpoints = self.calcContourPoints()
        ret = []

        for i in range(len(contourpoints) - 1):
            point = contourpoints[i]
            toGoPoint = contourpoints[i+1]
            ret += calcNextPointsArray(point, toGoPoint, self.distance_width)

        ret.append(contourpoints[len(contourpoints)-1])
        return ret


class SimpleEcho(WebSocket):
    def handleMessage(self):
        jsonobj = json.loads(self.data)
        filebase = "track" + time.strftime("%d-%m-%Y") + "_" + time.strftime("%Hu%M")
        print(jsonobj["type"])
        if jsonobj["type"] == "cornerpoints":
            cornerpoints = jsonobj["points"]
            row_width = float(jsonobj["row_width"])
            distance_width = float(jsonobj["distance_width"])
            print("Serversocket received: {}".format(jsonobj))

            pc = PointCalulator(cornerpoints, row_width, distance_width)
            self.sendMessage(json.dumps({"trackpoints": pc.calcAllpoints()}))
        elif jsonobj["type"] == "waypointfilepoints":
            cos = jsonobj["co"]
            myfile = open("/home/axelwillekens/robotTools/waypoints/" + filebase + '.waypoint', 'w+')
            for co in cos:
                myfile.write("{} {}\n".format(co[1], co[0]))
            myfile.close()
        elif jsonobj["type"] == "csvfilepoints":
            cos = jsonobj["co"]
            myfile = open("/home/axelwillekens/robotTools/robotTracker/tracks/" + filebase + '.csv', 'w+')
            myfile.write("number,latitude,longitude,time\n")
            cnt = 1
            for co in cos:
                myfile.write("{},{},{},-\n".format(cnt, co[1], co[0]))
                cnt += 1
            myfile.close()

    def handleConnected(self):
        print(self.address, 'connected')

    def handleClose(self):
        print(self.address, 'closed')


server = SimpleWebSocketServer('', 8003, SimpleEcho)
server.serveforever()
