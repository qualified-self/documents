/************************************************
 ** Class representing a state in the HFSM
 ************************************************
 ** jeraman.info, Sep. 30 2016 ******************
 ************************************************
 ************************************************/

////////////////////////////////////////
//importing whatever we need
import java.util.*;

////////////////////////////////////////
//the state class
public class State {
  private Vector<Connection> connections;
  private Vector<Task>       tasks;
  private String             name;
  private Status             status;

  //constructor
  public State(String name) {
    this.name = name;
    this.status = Status.INACTIVE;
    this.tasks = new Vector<Task>();
    this.connections = new Vector<Connection>();

    println("state " + this.toString() + " created!");
  }

  //run all tasks associated to this node
  void run () {
    for (Task t : tasks) 
      t.run();

    this.status = Status.RUNNING;

    println("running all tasks from state " + this.toString());
  }

  //stops all tasks associated to this node
  void stop() {
    for (Task t : tasks) 
      t.stop();

    this.status = Status.INACTIVE;

    println("stopping all tasks from state " + this.toString());
  }

  //gets the current status of this state
  Status get_status() {
    return this.status;
  }

  //updates the status of this state
  void update_status () {

    //updates the status first
    for (Task t : tasks) 
      t.update_status();

    //gets the status of the tasks associated to this state and updates accordingly
    for (Task t : tasks) {
      Status temporary_status = t.get_status();
      //updates accordingly
      if (temporary_status == Status.INACTIVE) {
        this.status = Status.INACTIVE; 
        break;
      }

      if (temporary_status == Status.RUNNING) {
        this.status = Status.RUNNING; 
        break;
      }

      if (temporary_status == Status.DONE)  
        this.status = Status.DONE;
    }

    println("State " + this.toString() + "state was updated to " + this.status);
  }



  //tries to change the current state. returns the next state if it's time to change
  State change_state(Input current_input) {

    //if it' not done yet, not ready to change
    if (this.status!=Status.DONE) {
      println("State " + this.toString() + " is not ready to change!");
      return null;
    }

    //if done, looks for the next state
    State next_state = null;

    //iterates over array
    for (Connection c : connections) {
      //looks if c's condition corresponds to the current input. if so changes the state
      if (c.is_condition_satisfied(current_input)) {
        next_state = c.get_next_state();
        println("State " + this.toString() + " is changing to " + next_state.toString());
        break;
      }
    }
    
    if (next_state==null)
      println("State " + this.toString() + " doesn't have a connection for this input! this is a bug!");

    return next_state;
  }



  //add a task t to this state
  void add_task(Task t) {
    tasks.addElement(t);
    println("Task " + t.toString() + " added to state " + this.toString());
  }

  //remove a task t from this state
  void remove_task(Task t) {
    if (tasks.contains(t))
      this.tasks.removeElement(t);
    else
      println("Unable to remove task " + t.toString() + " from state " + this.toString());
  }

  //add a connection to this state
  void add_connection(State next_state, Input condition) {
    Connection c = new Connection(next_state, condition);
    connections.addElement(c);
    println("Conenction " + c.toString() + " added to state " + this.toString());
  }

  //remove a connection from this state
  void remove_connection(Connection c) {
    if (connections.contains(c))
      this.connections.removeElement(c);
    else
      println("Unable to remove connection " + c.toString() + " from state " + this.toString());
  }
}