
#Presenting low-fidelity prototypes
First we presented and briefly discussed the two prototypes we developed over the last week:

- Sofian presented a functional prototype (Processing) of a working behavior tree;

(Add screenshot here)

- Jeronimo presented the paper prototype of the multi-paradigm left to right;

(Add picture here)

#Getting to know the users
At this stage, Chris joined us and he shared challenges & thoughts about tools he uses today in his practice. To make his points, Chris used as examples some previous & recent works, namely:

- **The N-Polytope**;
	
- **Haptic Fields**;

##Problems with timeline software
- Unnatural, not intuitive. "I do not think in timeline as in audio";

- You need to think about duration in order to compose (e.g. the introduction has 30 secs). Unfortunately, this is not desired in some cases;

##Problems with dataflow  
- Powerful, but it is hard to keep track of time: Where am I right now?

- Massive patch, not modularized: People get lost when debugging it (e.g. Ian struggled in debugging alone a massive patch in China);

##Summary: States, not timeline!
- Chris thinks differently about time: It's not about timeline, but about _state changing_;

- States could be thought as a set of variables that can be manipulated in the piece. For example, in Haptic fields there are for main states (burst, chase, sub, and f(?)). States can be changed according to users actions (state machine) or internal conditions (e.g. random). Each state has a set of media (e.g. light, sound, etc). These media are composed of a set of smaller variables (speed, intensity, etc) that can be concretely manipulated by the patch;

#Case studies
After that, we tried to apply the concept of behavior trees into the logic of the Haptic fields and the N-Polytope. Our goal was to test if Behavior Trees could work in a real-life context. It seems it works! As follows:

##Haptic fields

(Add picture here)

##N-Polytope

(Add picture here)
