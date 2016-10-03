/************************************************
 ** Basic enum for running machine
 ************************************************
 ** jeraman.info, Sep. 30 2016 ******************
 ************************************************
 ************************************************/

public static enum Status {
    INACTIVE,
    RUNNING,
    DONE,
}

//define here what input conditions this state machine has. these were set based in our scenario.
public static enum Input {
    PUSH,
    COIN,
    START_MAIN_LOOP,
    START_INTRODUCTION,
    START_SELF_APPEARS,
    DATA_SYNCED_OR_TIMEOUT,
    FINISH;
    
    public static final int size = Input.values().length;
    
    public int length() {
      return size;
    }
}

/*
//define here what input conditions this state machine has. these were set based in our scenario.
public static enum Input {
    PUSH,
    COIN
}
*/