/************************************************
 ** Class representing the main canvas **********
 ************************************************
 ** jeraman.info, Oct. 3 2016 *******************
 ************************************************
 ************************************************/

public class Canvas extends Task {
  State begin, end, actual;
  Vector<State> states;
  Status status;
  Input input_condition;

  //contructor
  public Canvas (String name, State ns, Input c) {
    super (name);
    begin = new State("Begin!");
    end = new State("End!");
    actual = begin;

    println("Canvas " + this.name + " is inited!");
  }

  //run all tasks associated to this node
  void run () {
    this.status = Status.RUNNING;
    actual.run();
    println("running the canvas " + this.name);
  }

  //stops all tasks associated to this node
  void stop() {
    //stopping all states...
    for (State s : states) 
      s.stop();

    //stop begin and end
    begin.stop();
    end.stop();

    //updating the actual
    actual = begin;

    this.status = Status.INACTIVE;

    println("stopping canvas" + this.name);
  }

  //updates the status of this state
  void update_status() {

    //if this state finished. test this condition, maybe you need to overload the comparison!
    if (actual==end) {
      this.status = Status.DONE;
      println("Canvas " + this.name +  "has reached its end and has successfully executed!");
    }
  }

  //function called everytime there is a new input
  void tick(Input current_input) {
    //updates input condition
    this.input_condition = current_input;

    //tries to update the next
    State next = null;

    //if it' a finish command, go to the last state. otherwise, continue the execution
    if (current_input==Input.FINISH)
      next = end;
    else
      next = actual.tick(input_condition);

    if (next!=null) //in case next is not null, change state!
      actual = next;
  }

  //add a state t to this state
  void add_state(State s) {
    states.addElement(s);
    println("State " + s.name + " added to canvas " + this.name);
  }

  //remove a task t from this state
  void remove_state(State s) {
    if (states.contains(s))
      this.states.removeElement(s);
    else
      println("Unable to remove state " + s.name + " from canvas " + this.name);
  }
}