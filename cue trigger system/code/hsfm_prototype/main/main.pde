/************************************************
 ** My main!
 ************************************************
 ** jeraman.info, Sep. 30 2016 ******************
 ************************************************
 ************************************************/

//Testing_State_Class t = new Testing_State_Class(this);
//Testing_Task_Class t = new Testing_Task_Class(this);
Testing_Connection_Class t = new Testing_Connection_Class(this);

void setup() {
  size(200, 200);
  t.setup();
}

void draw() {
  t.draw();
}

void mousePressed(){
  t.mousePressed();
}