In this lab we will be building the early detection scheme. When the
input changes from 0 to 1, the FSM responds immediately. The FSM then ignores the input for
about 20 ms to avoid glitches. After this amount of time, the FSM starts to check the input for
the falling edge. Follow the FSM design procedure to design the early debouncing scheme.

1. Derive the state diagram and ASM chart for the circuit.
2. Derive the HDL code based on the state diagram and/or ASM chart.
3. Derive a testbench and use simulation to verify operation of the code.
4. Show the switch signal and the debounced signal on the oscilloscope.

<img width="1003" alt="image" src="https://github.com/user-attachments/assets/e830018e-05e3-48c5-9e4f-f7acd77501df" />

**Diagram:**

<p align="center"> <img width="263" alt="p2" src="https://github.com/user-attachments/assets/57518a84-c988-46ab-92b6-fb9e989d26d5"> </p>

**ASM Chart:**

<p align="center"> <img width="269" alt="p1" src="https://github.com/user-attachments/assets/0f5df0ff-fd33-4d8b-9b21-7ea5dbf3ad79"> </p>

**Oscilloscope:**

<p align="center"> <img width="564" alt="image" src="https://github.com/user-attachments/assets/41364bd5-b758-4986-947a-45ddd4ce3789"> </p>
