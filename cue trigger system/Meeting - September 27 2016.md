# Two alternatives
- Behavior Trees
- HFSMs

## Important:
- We need to think about abstractions
- Local vs global variables (blackboard)

# Scenario: "The other self"

- 3 types of sensor: pulse, breathing, GSR
- setup with mirrors

## Tentative behavior tree
* sequence: "initialize"
	* switch everything off
	* start ambient sound
	* init vibropixel
	* bb[pulse_0] = 0
	* bb[pulse_1] = 0
	* bb[ambient_sound] = 0
	* bb[amplitude] = 0
* wait for trigger
* parallel:
	* parallel (decorator: repeat)
		* vibropixel-osc: "/pulse/0 $bb[pulse_0]"
		* vibropixel-osc: "/pulse/1 $bb[pulse_1]"
		* maxmsp-osc: "/sound/ambient $bb[ambient_sound]"
		* dmx: "/light/0 $bb[light_0_r] $bb[light_0_g] $bb[light_0_b]"
	* sequence: "main loop"
			* sequence "introduction" (decorator: repeat for X seconds)
				* bb[amplitude] = value() % script?
				* bb[ambient_sound] = bb[amplitude]
				* bb[pulse_0] = bb[amplitude] * bb[input_1]
				* bb[pulse_1] = bb[amplitude] * bb[input_0]
		* parallel "the self appears" (decorator: repeat for X seconds)
			* parallel "light control" (stop if one success)
				* parallel (dectorator: repeat)
					* bb["lights"][i]["r"] = sinewave()
					* bb[light_0_r] = sinewave()
					* bb[light_0_g] = sinewave()
					* bb[light_0_b] = sinewave()
				* sequence "light configurations"
					* sequence "configuration 1"
						* bb[light_0_on] = 1
						* bb[light_1_on] = 0
						* wait(5)
					* "configuration 2"
					* "configuration 3"
			* paralel "sound"
				* change the ambient amplitude
				* random "start random sounds"
					* sound 1
					* sound 2
					* sound 3
					* no sound
			* "pulses"
			* control parameters of lights (channels, intensity) (DMX)
			* the ambient sound continues (with varying amplitude)
			* other sounds get mixed in
			* the pulse changes in a different way
		* "synchrony" (runs for a certain amount of time)
			* are people's breathing synchronized OR have we reached the timeout?
				* yes: 
					* you see yourself in the glass for a second
					* they start feeling more intense vibration
					* crossfade and bump in amplitude of the heartbeat on the actuator (switches to their own heartbeat)
					* a final sound is triggered with a high amplitude ramp (the end)
