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
int additional=1;
Resistor resistor1 = new Resistor();
Resistor resistor2 = new Resistor();
Resistor resistor3 = new Resistor();
Resistor resistor4 = new Resistor();
Battery duracell = new Battery();
public void setup()
{
	
}
public void mouseClicked()
{
	if(mouseX>150&&mouseX<350&&mouseY>125&&mouseY<225){resistor2.resistance+=additional;}
	if(mouseX>650&&mouseX<850&&mouseY>125&&mouseY<225){resistor3.resistance+=additional;}
	if(mouseX>150&&mouseX<350&&mouseY>375&&mouseY<475){resistor1.resistance+=additional;}
	if(mouseX>650&&mouseX<850&&mouseY>375&&mouseY<475){resistor4.resistance+=additional;}
	if(mouseX>400&&mouseX<600&&mouseY>375&&mouseY<475){duracell.voltage+=additional;}
}
public void keyPressed()
{
	if(key == '1'){additional = 1;}
	if(key == '2'){additional = -1;}
}
public void draw()
{
	background(169,169,169);
	totalResistance = calTotRes();
	totalCurrent = duracell.voltage/totalResistance;
	resistor1.current = totalCurrent;
	resistor1.voltage = resistor1.resistance * totalCurrent;
	volt23 = rest23* totalCurrent;
	resistor2.current = volt23 / resistor2.resistance;
	resistor3.current = volt23 / resistor3.resistance;
	resistor2.voltage = volt23;
	resistor3.voltage = volt23;
	resistor4.current = totalCurrent;
	resistor4.voltage = resistor4.resistance * totalCurrent;
	stroke(0);
	strokeWeight(2);
	fill(255);
	rect(150,125,200,100);
	rect(400,125,200,100);
	rect(650,125,200,100);
	rect(150,375,200,100);
	rect(400,375,200,100);
	rect(650,375,200,100);
	textAlign(CENTER,CENTER);
	textSize(25);
	fill(0);
	text("Resistor 2",250,140);
	text("Resistor 2,3",500,140);
	text("Resistor 3",750,140);
	text("Resistor 1",250,390);
	text("Battery",500,390);
	text("Resistor 4",750,390);
	textSize(15);
	text(resistor2.resistance+" Ohm",250,165);
	text(resistor2.current+" Amps",250,185);
	text(resistor2.voltage+" Volts",250,205);
	text(rest23+" Ohm",500,165);
	text(totalCurrent+" Amps",500,185);
	text(volt23+" Volts",500,205);
	text(resistor3.resistance+" Ohm",750,165);
	text(resistor3.current+" Amps",750,185);
	text(resistor3.voltage+" Volts",750,205);
	text(resistor1.resistance+" Ohm",250,415);
	text(resistor1.current+" Amps",250,435);
	text(resistor1.voltage+" Volts",250,455);
	text(resistor4.resistance+" Ohm",750,415);
	text(resistor4.current+" Amps",750,435);
	text(resistor4.voltage+" Volts",750,455);
	textSize(30);
	text(duracell.voltage+" Volts",500,440);
	strokeWeight(8);
	line(60,50,420,50);
	line(420,50,440,90);
	line(440,90,480,10);
	line(480,10,520,90);
	line(520,90,560,10);
	line(560,10,580,50);
	line(580,50,940,50);
	line(940,50,940,345);
	line(60,50,60,345);
	line(60,315,420,315);
	line(420,315,440,355);
	line(440,355,480,275);
	line(480,275,520,355);
	line(520,355,560,275);
	line(560,275,580,315);
	line(580,315,940,315);
	line(60,345,20,365);
	line(20,365,100,405);
	line(100,405,20,445);
	line(20,445,100,485);
	line(100,485,60,505);
	line(60,505,60,540);
	line(60,540,485,540);
	line(485,515,485,565);
	line(515,500,515,580);
	line(515,540,940,540);
	line(940,345,900,365);
	line(900,365,980,405);
	line(980,405,900,445);
	line(900,445,980,485);
	line(980,485,940,505);
	line(940,505,940,540);
	if(additional==1){stroke(255,0,0);fill(255,0,0);}
	else if(additional==-1){stroke(0,0,255);fill(0,0,255);}
	ellipse(mouseX, mouseY, 25, 25);
}
public float calTotRes()
{
	rest23 = 1/((1/resistor2.resistance)+(1/resistor3.resistance));
	return resistor1.resistance + rest23 + resistor4.resistance;
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
