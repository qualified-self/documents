# "The other self" (simple version)

## Parameters/setup
* 1 x SUBJECT
* 1 x system SUPERVISOR
* 1 x type of SENSOR (bitalino)
* 2 x VIBROPIXEL (controlled together)
* 1 x STROBE
* 2 x SPEAKER
  * 1 x AMBIENT sound
  * 1 x BEAT sound

## Scenario
1. SUBJECT sits down and SUPERVISOR hooks him/her up with the system
2. Wait for a trigger from SUPERVISOR
3. Intro (runs for approximately 1 minute)
  * Amplitude of AMBIENT sound increases
  * VIBROPIXEL amplitude increases at the same time (subtle)
4. The self appears: runs for 1 minute, then stop when either (1) the subject's SENSOR input is in synch (*) with the BEAT or (2) when we have reached a timeout (3 minutes)
  * Everything stops
  * BEAT sound starts
  * Configurations (intensity, duration, rate) of the STROBE are activated randomly at semi-regular intervals
5. Synchrony (1 minute)
  * AMBIENT sound returns
  * BEAT sound increases
  * VIBROPIXEL increases
6. Outro (30 seconds)
  * Sounds fade out quickly
7. The end (everything over)

(*) "In sync" : We will leave it to Max/MSP to send a measurement of synchrony in (0..1): the cue control system will detect synchrony if this value is bigger than 0.5 for at least 10 seconds.
