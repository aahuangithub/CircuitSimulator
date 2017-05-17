import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CircuitSimulator extends PApplet {

float totalResistance;
float rest23 = 0;
float volt23 = 0;
float totalCurrent;
Resistor resistor1 = new Resistor();
Resistor resistor2 = new Resistor();
Resistor resistor3 = new Resistor();
Resistor resistor4 = new Resistor();
Battery duracell = new Battery();
public void setup()
{
	
}
public void draw()
{
	background(255);
	totalResistance = calTotRes();
	totalCurrent = duracell.voltage/totalResistance;
	resistor1.current = totalCurrent;
	resistor1.voltage = resistor1.resistance * totalCurrent;
	volt23 = rest23* totalCurrent;
	resistor2.current = volt23 / resistor2.resistance;
	resistor3.current = volt23 / resistor2.resistance;
	resistor4.current = totalCurrent;
	resistor4.voltage = resistor4.resistance * totalCurrent;
}
public float calTotRes()
{
	rest23 = 1/((1/resistor2.resistance)+(1/resistor3.resistance));
	return resistor1.resistance + rest23 + resistor4.resistance;
}
public void showInfoBox()
{
}
class Resistor
{
	float resistance;
	float current;
	float voltage;
	Resistor()
	{
		resistance = 1.0f;
	}
}
class Battery
{
	float voltage;
	Battery()
	{
		voltage = 4.0f;
	}
}
  public void settings() { 	size(1000,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CircuitSimulator" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
