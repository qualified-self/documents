/************************************************
 ** Basic file created to test the Task Class
 ************************************************
 ** jeraman.info, Sep. 30 2016 ******************
 ************************************************
 ************************************************/

class Testing_Task_Class {

  AudioTask at;
  OSCTask ot;
  PApplet p;

  Testing_Task_Class(PApplet p) {
    this.p = p;
  }

  void setup() {
    Object[] m = {1, 2, 3, 4, "test", 3.4};

    at = new AudioTask(p, "Testing audio", "vibraphon.aiff");
    ot = new OSCTask(p, "Testing OSC", 5000, "127.0.0.1", m); 
    at.run();
    ot.run();
  }

  void draw () {
    at.update_status();

    switch(ot.get_status()) {
    case INACTIVE:
      background(0, 0, 0);
      break;

    case RUNNING:
      background(0, 0, 255);
      break;

    case DONE:
      background(255, 0, 0);
      break;
    }
  }


  void mouseClicked() {
    Object[] m = {mouseX, mouseY};
    ot.update_message(m);
    ot.run();
  }
}