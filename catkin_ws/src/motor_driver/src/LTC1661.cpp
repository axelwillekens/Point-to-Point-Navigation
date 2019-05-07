/* 
  LTC1661.h - Raspberry Pi Library for Linear Technology LTC1661CN8 10bit dual DAC
  
  This Library provides functions to set both outputs of the LTC1661.
  
  Maximum SPI frequency is 16.7MHz at 4.5-5.5V, and 10MHz at 2.7-5.5V.
  Arduino standard SPI frequency is 4MHz (SPI_CLOCK_DIV4) so no change is needed.
  
  version 1.0 (Feb 9, 2014)
  Created by Stefan Wallnoefer, Feb 8, 2014.
  Copyright (c) 2014 Stefan Wallnoefer(walle86) under The MIT License (MIT)
  for other librarys and sketches look at https://github.com/walle86/ 
 
  edited by Axel Willekens (mapped to Raspberry Pi hardware)
  WiringPi library used -- written by Gordon Henderson look at http://wiringpi.com/
*/

#include "ros/ros.h"
extern "C"{
   #include <wiringPi.h>
   #include <wiringPiSPI.h>
}
#include <LTC1661.h>
#include <unistd.h>
#include <math.h>


#define SPI_CHAN     0
#define SPI_SPEED    16700000
#define BUF_SIZE     2
#define CS_N         25

int fd, res;

LTC1661::LTC1661() {
  _resolution = 10;
  _highValue = pow(2, _resolution) - 1;

  wiringPiSetup();
  pinMode(CS_N, OUTPUT);
  digitalWrite(CS_N, HIGH);

  if((fd = wiringPiSPISetup (SPI_CHAN , SPI_SPEED)) < 0){ // LTC1661 works on 16.7 MHz
     ROS_INFO("wiringPiSPISetup failed");
  } else {
     ROS_INFO("wiringPiSPISetup succeeded");
  }
}

void LTC1661::sendData(short int data){
  unsigned char databuf[2];
  databuf[1] = (unsigned char) data;
  databuf[0] = (unsigned char) (data >> 8);

  digitalWrite(CS_N, LOW); //Select DAC
  if((res = write(fd, databuf, 2)) < 1){
     ROS_INFO("SPI write failure");
  }else{
     ROS_INFO("Number of bytes written: %d", res);
     ROS_INFO("Data written to the bus: %x%x", databuf[0], databuf[1]);
  } 
  digitalWrite(CS_N, HIGH);
}

void LTC1661::sleep() {
  sendData(SLEEP);
}

void LTC1661::wakeUp() {
  sendData(WAKE);
}

void LTC1661::update() {
  sendData(UPDATE);
}

//Data as int

void LTC1661::loadA(int valueA) {
  valueA = constrain(valueA, 0, _highValue); //constrain Value

  sendData(LOADA | valueA << 2);  //4 commandbits + 10 databits + 2 dont care bits
}

void LTC1661::loadB(int valueB) {
  valueB = constrain(valueB, 0, _highValue); //constrain Value

  sendData(LOADB | valueB << 2);  //4 commandbits + 10 databits + 2 dont care bits
}

void LTC1661::loUpA(int valueA) {
  valueA = constrain(valueA, 0, _highValue); //constrain Value
  ROS_INFO("valueA: %d", LOUPA | valueA << 2); 

  sendData(LOUPA | valueA << 2);  //4 commandbits + 10 databits + 2 dont care bits
}

void LTC1661::loUpB(int valueB) {
  valueB = constrain(valueB, 0, _highValue); //constrain Value
  
  ROS_INFO("valueB: %d", LOUPB | valueB << 2); 
  sendData(LOUPB | valueB << 2);  //4 commandbits + 10 databits + 2 dont care bits
}

void LTC1661::loUp(int value) {
  value = constrain(value, 0, _highValue); //constrain Value
  
  sendData(LOUP | value << 2);  //4 commandbits + 10 databits + 2 dont care bits
}

void LTC1661::load(int valueA, int valueB) {
  loadA(valueA);
  loadB(valueB);
}

void LTC1661::loUp(int valueA, int valueB) {
  loUpA(valueA);
  loUpB(valueB);
}

void LTC1661::loadCH(char channel, int value) {
  switch (channel) {
    case 0:   //0 for Channel A
      loadA(value);
      break;
    case 1:   //1 for Channel B
      loadB(value);
      break;
    case 'A':
      loadA(value);
      break;
    case 'B':
      loadB(value);
      break;
  }
}

void LTC1661::loUpCH(char channel, int value) {
  switch (channel) {
    case 0:   //0 for Channel A
      loUpA(value);
      break;
    case 1:   //1 for Channel B
      loUpB(value);
      break;
    case 'A':
      loUpA(value);
      break;
    case 'B':
      loUpB(value);
      break;
  }
}

//Data as double in Vout/Vref
//if you only write for example loadA(0.9), it will be send as double

void LTC1661::loadA(double valueA) {
  int value = round(_highValue * valueA);
  loadA(value);
}

void LTC1661::loadB(double valueB) {
  int value = round(_highValue * valueB);
  loadB(value);
}

void LTC1661::loUpA(double valueA) {
  int value = round(_highValue * valueA);
  loUpA(value);
}

void LTC1661::loUpB(double valueB) {
  int value = round(_highValue * valueB);
  loUpB(value);
}

void LTC1661::loUp(double valueIn) {
  int value = round(_highValue * valueIn);
  loUp(value);
}

void LTC1661::load(double valueA, double valueB) {
  loadA(valueA);
  loadB(valueB);
}

void LTC1661::loUp(double valueA, double valueB) {
  loUpA(valueA);
  loUpB(valueB);
}

void LTC1661::loadCH(char channel, double value) {
  switch (channel) {
    case 0:   //0 for Channel A
      loadA(value);
      break;
    case 1:   //1 for Channel B
      loadB(value);
      break;
    case 'A':
      loadA(value);
      break;
    case 'B':
      loadB(value);
      break;
  }
}

void LTC1661::loUpCH(char channel, double value) {
  switch (channel) {
    case 0:   //0 for Channel A
      loUpA(value);
      break;
    case 1:   //1 for Channel B
      loUpB(value);
      break;
    case 'A':
      loUpA(value);
      break;
    case 'B':
      loUpB(value);
      break;
  }
}

void LTC1661::dWrite(char channel, int state){
  if(state == LOW){
    loUpCH(channel, 0);
  }
  else{
    loUpCH(channel, _highValue);
  }
  usleep(30);  //delay to get a stable output
}

int LTC1661::constrain(int x, int a, int b){
   if (x < a) return a;
   else if (x > b) return b;
   else return x;
}
