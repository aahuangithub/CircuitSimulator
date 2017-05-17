float totalResistance;
float rest23 = 0;
float volt23 = 0;
float totalCurrent;
Resistor resistor1 = new Resistor();
Resistor resistor2 = new Resistor();
Resistor resistor3 = new Resistor();
Resistor resistor4 = new Resistor();
Battery duracell = new Battery();
void setup()
{
	size(1000,600);
}
void draw()
{
	background(169,169,169);
	totalResistance = calTotRes();
	totalCurrent = duracell.voltage/totalResistance;
	resistor1.current = totalCurrent;
	resistor1.voltage = resistor1.resistance * totalCurrent;
	volt23 = rest23* totalCurrent;
	resistor2.current = volt23 / resistor2.resistance;
	resistor3.current = volt23 / resistor2.resistance;
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
	textSize(10);
	text(resistor2.resistance+" Ohm",250,165);
	text(resistor2.current+" Amps",250,185);
	text(resistor2.voltage+" Volts",250,205);
	text(rest23+" Ohm",500,165);
	text(totalCurrent+" Amps",500,185);
	text(volt23+" Volts",500,205);
	text(resistor3.resistance+" Ohm",750,165);
	text(resistor3.current+" Amps",750,185);
	text(resistor3.voltage+" Volts",750,205);
	text(resistor2.resistance+" Ohm",250,415);
	text(resistor2.current+" Amps",250,435);
	text(resistor2.voltage+" Volts",250,455);
	text(rest23+" Ohm",500,415);
	text(totalCurrent+" Amps",500,435);
	text(volt23+" Volts",500,455);
	text(resistor3.resistance+" Ohm",750,415);
	text(resistor3.current+" Amps",750,435);
	text(resistor3.voltage+" Volts",750,455);
}
float calTotRes()
{
	rest23 = 1/((1/resistor2.resistance)+(1/resistor3.resistance));
	return resistor1.resistance + rest23 + resistor4.resistance;
}
void showInfoBox()
{
}
class Resistor
{
	float resistance;
	float current;
	float voltage;
	Resistor()
	{
		resistance = 1.0;
	}
}
class Battery
{
	float voltage;
	Battery()
	{
		voltage = 4.0;
	}
}