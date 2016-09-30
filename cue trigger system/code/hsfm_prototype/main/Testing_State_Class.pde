/************************************************
 ** Basic file created to test the State Class
 ************************************************
 ** jeraman.info, Sep. 30 2016 ******************
 ************************************************
 ************************************************/


State s;
AudioTask t1;
OSCTask t2;

void setup_state_class() {
  s = new State("my first state!");

  Object[] m = {1, 2, 3, 4, "test", 3.4};

  at = new AudioTask(this, "Testing audio", "vibraphon.aiff");
  ot = new OSCTask(this, "Testing OSC", 5000, "127.0.0.1", m); 

  s.add_task(at);
  s.add_task(ot);
}

void draw_state_class() {
  s.update_status();

  switch(s.get_status()) {
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

void mousePressed_state_class() {
  s.run();
}
void mouseReleased_state_class() {
  s.stop();
}