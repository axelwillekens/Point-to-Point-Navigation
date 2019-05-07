#include "ros/ros.h"
extern "C" {
   #include <wiringPi.h>
}
#include <LTC1661.h>
#include "std_msgs/Int16MultiArray.h"

// use wPi pin numbers, see them using gpio readall
// sommige pinnen hebben een speciale functie zo is GPIO26 de gpio-shutdown
// staat gespecifieerd in /boot/config.txt, meer weten, lees /boot/overlays/README
// Pin 25 werd reeds gebruikt als CS voor de communicatie met de DAC
#define ENABLE           7

#define DIRVOORLINKS     4  
#define DIRVOORRECHTS    5
#define DIRACHTERLINKS   22
#define DIRACHTERRECHTS  23

#define STOPVOORLINKS    0
#define STOPVOORRECHTS   2
#define STOPACHTERLINKS  3
#define STOPACHTERRECHTS 21

LTC1661 dac; //connect DAC: chip <--> raspberry pi => Din(3) <--> MOSI(19); CS(3) <--> CE0_N(18); SCK(2) <--> SCLK(23)

void initialize_wiring(){
  wiringPiSetup () ;

  pinMode(DIRVOORLINKS, OUTPUT);
  pinMode(DIRVOORRECHTS, OUTPUT);
  pinMode(DIRACHTERLINKS, OUTPUT);
  pinMode(DIRACHTERRECHTS, OUTPUT);

  pinMode(STOPVOORLINKS, OUTPUT);
  pinMode(STOPVOORRECHTS, OUTPUT);
  pinMode(STOPACHTERLINKS, OUTPUT);
  pinMode(STOPACHTERRECHTS, OUTPUT);

  pinMode(ENABLE, OUTPUT);

  // initial values
  digitalWrite(STOPVOORLINKS, HIGH);
  digitalWrite(STOPACHTERLINKS, HIGH);
  digitalWrite(STOPVOORRECHTS, HIGH);
  digitalWrite(STOPACHTERRECHTS, HIGH);
  digitalWrite(ENABLE, HIGH);
  ROS_INFO("intialization done");
}

// ******************driving purposes*********************************
void DIRForward_left(int snelheid){
  ROS_INFO("DIRs left: %d", snelheid);
  if (snelheid > 0){
    digitalWrite(STOPVOORLINKS, LOW);
    digitalWrite(STOPACHTERLINKS, LOW);

    digitalWrite(DIRVOORLINKS, HIGH);
    digitalWrite(DIRACHTERLINKS, HIGH);
    dac.loUpA(snelheid);
  } else if (snelheid < 0){
    digitalWrite(STOPVOORLINKS, LOW);
    digitalWrite(STOPACHTERLINKS, LOW);

    digitalWrite(DIRVOORLINKS, LOW);
    digitalWrite(DIRACHTERLINKS, LOW);
    dac.loUpA(snelheid);
  } else {
    digitalWrite(STOPVOORLINKS, HIGH);
    digitalWrite(STOPACHTERLINKS, HIGH);
    dac.loUpA(snelheid);
  }
}


void DIRForward_right(int snelheid){
  ROS_INFO("DIRs right: %d", snelheid);
  if (snelheid > 0){
    digitalWrite(STOPVOORRECHTS, LOW);
    digitalWrite(STOPACHTERRECHTS, LOW);

    digitalWrite(DIRVOORRECHTS, LOW);
    digitalWrite(DIRACHTERRECHTS, LOW);
    dac.loUpB(snelheid);
  } else if (snelheid < 0) {
    digitalWrite(STOPVOORRECHTS, LOW);
    digitalWrite(STOPACHTERRECHTS, LOW);

    digitalWrite(DIRVOORRECHTS, HIGH);
    digitalWrite(DIRACHTERRECHTS, HIGH);
    dac.loUpB(snelheid);
  } else {
    digitalWrite(STOPVOORRECHTS, HIGH);
    digitalWrite(STOPACHTERRECHTS, HIGH);
    dac.loUpB(snelheid);
  }
}

void steeringCallback(const std_msgs::Int16MultiArray& msg)
{
  std::vector<short int> arr = msg.data;
  DIRForward_left(arr[0]);
  DIRForward_right(arr[1]);
}

int main(int argc, char **argv)
{
  initialize_wiring();

  ros::init(argc, argv, "motor_driver");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("steering_topic", 1000, steeringCallback);

  ros::spin();
  return 0;
}
