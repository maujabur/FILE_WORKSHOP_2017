int x, y, b ;

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  pinMode(A0, INPUT_PULLUP);
}

void loop() {

  x = analogRead(A2);
  y = analogRead(A1);

  b = digitalRead(A0) * 500;

  Serial.print(x);
  Serial.print(", ");
  Serial.print(y);
  Serial.print(", ");
  Serial.print(b);
  Serial.println();

  delay(100);
}
