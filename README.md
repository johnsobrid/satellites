satellites
==========
Satellites is a program designed to enable a user to control mechatronic devices with an iOS device, using Open Sound Control (OSC). 

It's very simple, and is intended to allow your iOS device to be used as a control pendant for a mechatronic device. As such, this app is part of a chain of software: user input values are transmitted over OSC to a host PC; the host PC communicates with a microcontroller (over Serial); the microcontroller moves the actuators accordingly. The code shown here will only accomplish the first of those several steps, but is designed in such a way as to allow straightforward use in a performance or testing context.

To use, input an IP address and a port (make sure to hit 'return' on your iOS device's keyboard).
Move the sliders-- the displayed text will be sent to the desination IP + port.

This code uses the VVOSC framework to handle the OSC.
