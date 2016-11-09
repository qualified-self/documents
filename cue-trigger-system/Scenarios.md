# "The other self" (simple version)

## Parameters/setup
* 1 x SUBJECT
* 1 x system CONTROLLER (ie. supervisor)
* 1 x type of SENSOR (bitalino)
* 2 x VIBROPIXEL (controller together)
* 1 x STROBE
* 2 x SPEAKER
  * 1 x AMBIENT sound
  * 1 x BEAT sound

## Scenario
1. SUBJECT sits down and CONTROLLER hooks him/her up with the system
2. Wait for a trigger from CONTROLLER
3. Intro
  * Amplitude of AMBIENT sound increases
  * VIBROPIXEL amplitude increases at the same time (subtle)
4. The self appears
  * Everything stops
  * BEAT sound starts
  * Configurations (intensity, duration, rate) of the STROBE are activated randomly at semi-regular intervals
5. Synchrony: triggers when the subject's SENSOR input synch with the BEAT *or* when we have reached a timeout
  * AMBIENT sound returns
  * BEAT sound increases
  * VIBROPIXEL increases
6. Outro
  * Sounds fade out quickly
7. The end
