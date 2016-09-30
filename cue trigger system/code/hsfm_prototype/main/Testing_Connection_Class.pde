/************************************************
 ** Basic file created to test the Connection Class
 ************************************************
 ** jeraman.info, Sep. 30 2016 ******************
 ************************************************
 ************************************************/


class Testing_Connection_Class {

  State s1, s2, s3;
  AudioTask t1;
  OSCTask t2;
  PApplet p;

  Testing_Connection_Class(PApplet p) {
    this.p = p;
  }
  
  void setup() {
    s1 = new State("s1!");
    s2 = new State("s2!");
    s3 = new State("s3!");

    t1 = new AudioTask(p, "Testing audio", "vibraphon.aiff");
    t2 = new OSCTask(p, "Testing OSC", 5000, "127.0.0.1", new Object[]{1, 2, 3, 4, "test", 3.4}); 

    s1.add_task(t1);
    s1.add_task(t1);
    s1.add_task(t1);
    s1.add_task(t2);
    s1.add_task(t2);

    s2.add_task(t1);
    s2.add_task(t1);
    s2.add_task(t1);
    s2.add_task(t2);
    s2.add_task(t2);

    s3.add_task(t1);
    s3.add_task(t1);
    s3.add_task(t1);
    s3.add_task(t2);
    s3.add_task(t2);
  }

  void draw() {
  }

  void mousePressed() {
  }
  void mouseReleased() {
  }
}