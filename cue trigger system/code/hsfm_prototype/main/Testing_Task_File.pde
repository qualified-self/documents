/************************************************
 ** Basic file created to test the Task Class
 ************************************************
 ** jeraman.info, Sep. 30 2016 ******************
 ************************************************
 ************************************************/

AudioTask at;
OSCTask ot;

void setup_task_test() {
  Object[] m = {1,2,3,4, "test", 3.4};
  
  at = new AudioTask(this, "Testing audio", "vibraphon.aiff");
  ot = new OSCTask(this, "Testing OSC", 5000, "127.0.0.1", m); 
  at.run();
  ot.run();
}

void draw_task_test () {
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


void mouseClicked_task_test() {
  Object[] m = {mouseX, mouseY};
  ot.update_message(m);
  ot.run();
}