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
  private Vector<Task> tasks;
  //private Next_State   next_state;
  private String       name;
  private Status       status;

  //constructor
  public State(String name) {
    this.name = name;
    this.status = Status.INACTIVE;
    this.tasks = new Vector<Task>();

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
}