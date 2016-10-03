/************************************************
 ** Basic file created to test the Connection Class
 ************************************************
 ** State machine designed: *********************
 ** https://en.wikipedia.org/wiki/File:Turnstile_state_machine_colored.svg
 ************************************************
 ** jeraman.info, Oct. 3 2016 *******************
 ************************************************
 ************************************************/


class Testing_Connection_Class {
  State root; 

  State locked, unlocked;
  Connection c1, c2, c3, c4;

  AudioTask t1;
  OSCTask t2, t3;
  PApplet p;

  Testing_Connection_Class(PApplet p) {
    this.p = p;
  }

  void setup() {
    locked   = new State("locked!");
    unlocked = new State("unlocked!");

    t1 = new AudioTask(p, "Playing sound!", "vibraphon.aiff");
    t2 = new OSCTask(p, "Sending OSC!", 5000, "127.0.0.1", new Object[]{1, 2, 3, 4, "test", 3.4});
    t3 = new OSCTask(p, "Sending another OSC!", 5000, "127.0.0.1", new Object[]{'a', 'b'});

    adding_tasks();
    creating_connections();

    root = locked;
    root.run();

    println("the FSM is ready!");
  }

  void adding_tasks() {
    //locked.add_task(t1);
    //locked.add_task(t1);
    //locked.add_task(t1);
    locked.add_task(t2);
    locked.add_task(t2);

    //unlocked.add_task(t1);
    //unlocked.add_task(t1);
    //unlocked.add_task(t1);
    unlocked.add_task(t3);
    unlocked.add_task(t3);
  }

  void creating_connections () {
    locked.connect(Input.PUSH, locked);
    locked.connect(Input.COIN, unlocked);

    unlocked.connect(Input.PUSH, locked);
    unlocked.connect(Input.COIN, unlocked);
  }

  void draw() {
    root.update_status();
    gui();
  }

  void gui() {
    //drawing background
    switch(root.get_status()) {
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

    textSize(32);
    textAlign(CENTER);
    fill(100, 100, 100);
    text(root.name, width/2, height/2);
  }

  void mousePressed() {
    int chances = int(random(2));

    if (chances == 0) //if push..
      println("input: PUSH!");
    else
      println("input: COIN!");

    if (chances == 0) //if push..
      root = root.tick(Input.PUSH);
    else  //if coin...
    root = root.tick(Input.COIN);
  }

  void mouseReleased() {
  }
}