;;;;;
//fuck java and your semicolons

float totalResistance;
float rest23;
float volt23;
float totalCurrent;
int additional;
Resistor[] resistors = {};
Resistor resistor1 = new Resistor();
Resistor resistor2 = new Resistor();
Resistor resistor3 = new Resistor();
Resistor resistor4 = new Resistor();
Battery duracell;

void setup(){
	size(1000,600);
	textAlign(CENTER,CENTER);
	additional = 1;
	duracell = new Battery();
	volt23 = rest23 = 0;
}
void mouseClicked(){
	if(mouseX>150&&mouseX<350&&mouseY>125&&mouseY<225){
		resistor2.changeResistance();
	}
	if(mouseX>650&&mouseX<850&&mouseY>125&&mouseY<225){
		resistor3.changeResistance();
	}
	if(mouseX>150&&mouseX<350&&mouseY>375&&mouseY<475){
		resistor1.changeResistance();
	}
	if(mouseX>650&&mouseX<850&&mouseY>375&&mouseY<475){
		resistor4.changeResistance();
	}
	if(mouseX>400&&mouseX<600&&mouseY>375&&mouseY<475){
		duracell.changeVoltage();
	}
}
void keyPressed(){
	if(key == '1'){additional = 1;}
	if(key == '2'){additional = -1;}
}
void draw(){
	background(169,169,169);
	stroke(0);
	strokeWeight(2);
	totalResistance = calTotRes();
	totalCurrent = duracell.voltage/totalResistance;
	resistor1.current = totalCurrent;
	resistor1.voltage = resistor1.resistance * totalCurrent;
	volt23 = rest23 * totalCurrent;
	resistor2.current = volt23 / resistor2.resistance;
	resistor3.current = volt23 / resistor3.resistance;
	resistor2.voltage = volt23;
	resistor3.voltage = volt23;
	resistor4.current = totalCurrent;
	resistor4.voltage = resistor4.resistance * totalCurrent;

	fill(255);
	rect(150,125,200,100);
	rect(400,125,200,100);
	rect(650,125,200,100);
	rect(150,375,200,100);
	rect(400,375,200,100);
	rect(650,375,200,100);
	

	textSize(25);
	fill(0);
	text("Resistor 2",250,140);
	text("Resistor 2,3",500,140);
	text("Resistor 3",750,140);
	text("Resistor 1",250,390);
	text("Battery",500,390);
	text("Resistor 4",750,390);

	textSize(15);

	//TODO: Use set/get
	text(resistor2.resistance+" Ohm",250,165);
	text(r(resistor2.current)+" Amps",250,185);
	text(r(resistor2.voltage)+" Volts",250,205);
	text(r(rest23)+" Ohm",500,165);
	text(r(totalCurrent)+" Amps",500,185);
	text(r(volt23)+" Volts",500,205);
	text(resistor3.resistance+" Ohm",750,165);
	text(r(resistor3.current)+" Amps",750,185);
	text(r(resistor3.voltage)+" Volts",750,205);
	text(resistor1.resistance+" Ohm",250,415);
	text(r(resistor1.current)+" Amps",250,435);
	text(r(resistor1.voltage)+" Volts",250,455);
	text(resistor4.resistance+" Ohm",750,415);
	text(r(resistor4.current)+" Amps",750,435);
	text(r(resistor4.voltage)+" Volts",750,455);

	textSize(30);
	text(r(duracell.voltage)+" Volts",500,440);

	strokeWeight(8);

	//Battery
	line(485,515,485,565);
	line(515,500,515,580);

	//Resistors**
	//TODO: enclose these inside functions
	//resistor 1
	line(20,365,100,405);
	line(20,445,100,485);
	line(60,345,20,365);
	line(100,405,20,445);
	line(100,485,60,505);
	//resistor 2
	line(420,315,440,355);
	line(440,355,480,275);
	line(480,275,520,355);
	line(520,355,560,275);
	line(560,275,580,315);
	//resistor 2,3
	line(420,50,440,90);
	line(440,90,480,10);
	line(480,10,520,90);
	line(520,90,560,10);
	line(560,10,580,50);
	//resistor 4
	line(900,365,980,405);
	line(900,445,980,485);
	line(940,345,900,365);
	line(980,405,900,445);
	line(980,485,940,505);

	//TODO: Make this not hard-coded
	//Wiring**
	line(60,50,420,50);
	line(580,50,940,50);
	line(940,50,940,345);
	line(60,50,60,345);
	line(60,315,420,315);
	line(580,315,940,315);
	//resistor 1 -> battery
	line(60,505,60,540);
	line(60,540,485,540);
	//resistor 4 -> battery
	line(515,540,940,540);
	line(940,505,940,540);



	if(additional==1){
		stroke(255,0,0);
		fill(255,0,0);
	}
	else if(additional==-1){
		stroke(0,0,255);
		fill(0,0,255);
	}

	//mouse cursor
	ellipse(mouseX, mouseY, 25, 25);
}

float calTotRes(){
	rest23 = 1/((1/resistor2.resistance)+(1/resistor3.resistance));
	return resistor1.resistance + rest23 + resistor4.resistance;
}

//rounds to 2 decimals
float r(float i){return Math.round(i*100.0)/100.0;}

class Resistor{
	//TODO: use set/gets rather than accessing directly
	float resistance, current, voltage;
	private float x,y;
	Resistor(){
		resistance = 1.0;
	}
	public void changeResistance(){
		if(additional>0)
			resistance+=additional;
		else
			if(resistance>0)
				resistance+=additional;

	}
}


class Battery
{
	private float voltage;
	private float x,y;
	Battery(){
		voltage = 4.0;
	}
	public void changeVoltage(){
		if(additional>0)
			voltage+=additional;
		else
			if(voltage>0)
				voltage+=additional;
	}
}