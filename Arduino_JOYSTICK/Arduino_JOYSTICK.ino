// Baseado em exemplo da biblioteca:
//
// NOTE: This sketch file is for use with Arduino Leonardo and
//       Arduino Micro only.
//
// by Matthew Heironimus
// 2016-11-24
//--------------------------------------------------------------------

#include <Joystick.h>

Joystick_ Joystick(JOYSTICK_DEFAULT_REPORT_ID, JOYSTICK_TYPE_JOYSTICK,
                   3, 0,                  // Button Count, Hat Switch Count
                   true, true, false,     // X and Y, but no Z Axis
                   false, false, false,   // No Rx, Ry, or Rz
                   false, false,          // No rudder or throttle
                   false, false, false);  // No accelerator, brake, or steering

int x_eixo = A2;
int y_eixo = A1;

int fire = A0;

void setup() {
  pinMode(fire, INPUT_PULLUP);

  // Initialize Joystick Library
  Joystick.begin();
}

void loop() {

  Joystick.setButton(0, !digitalRead(fire));
  
  Joystick.setXAxis(analogRead(x_eixo));
  Joystick.setYAxis(analogRead(y_eixo));

  delay(10);
}

