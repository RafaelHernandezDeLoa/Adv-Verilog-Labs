# lab-11-keyboard-or-mouse-controlled-chasing-led-the-multiplexers
## Keyboard or mouse controlled chasing LED
Consider the Chasing LEDs experiment (Lab 6). Instead of switches and buttons, we can use the keyboard to set the speed and the pause operation (i.e. moving the LED to the rightmost position)
- Use the P (for “pause) key to pause and resume the chasing operation
- Use the following key sequence to enter the desired flashing period: F1 and then three- digit keys (i.e. 000 to 999)
- All other keys or illegal sequences should be ignored

If your keyboard doesn’t support Boot HID, use a USB mouse instead to implement a similar functionality:
- Use the left mouse button to pause and resume the flashing operating.
- Use right mouse button to enter a new speed. Use the value of x to increment or decrement the period, then press the right mouse button again to resume chasing with the new speed.

Whether you use a Mouse or a Keyboard, use the seven-segment display to show the status of the system:
- Display the letter “P.” on the left most seven-segment (segment: 7) whenever the system is in a pause state
- Display the letters “SP:” in the seven-segments (3, 4, 5)
- Display the system’s speed (000 to 999) on the right most seven-segment (segments: 0, 1, 2)
- The image below shows an example of a paused system with a speed of 834

![image](https://github.com/user-attachments/assets/9388bf3b-2653-4ef9-a5a8-d4261cc013e3)


## Clarifications about my lab:
The chasing LEDs lab is a lab where one LED on the FPGA board would be on at one time. The board would shine a light throught the leds which would seem to move to the other side of the board, reach the last LED, then head back the other direction and this process gets repeated. In that lab, we could control how fast the light seems to be moving and had an option to paue the program in the form of lightin up only the right most LED and keeping that like on till we decide to unpause the program. Back to this lab, I choose to use a mouse to complete the lab. The buttons on the mouse helps me command the board the same way as with the chasing LEDs lab. As mentioned above, the left mouse button in this lab does pause the program and allows the light to remain in place unlike the other lab and the right button will help us set up the speed of this moving light. When I click the right button of the mouse, the program will get the mouse's horizontal displacement (left and right on the surface the mouse is on) since the button was last pressed till when that same button gets pressed again later. This value is used to help us set how long a LED should be on for before turning off this LED and turning on the following LED. This value gets added if mouse was displaced to the right or subtracted if displaced to the left from the current value which determines the speed the light is moving at. If this value gets bigger, the light moves around slowly and vise versa. The determining speed value actually is the wait time between each change in the lighting of the board.
. The left mouse button will pause or unpause the program, keeping the powered led on till we unpause the program
