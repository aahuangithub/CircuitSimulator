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