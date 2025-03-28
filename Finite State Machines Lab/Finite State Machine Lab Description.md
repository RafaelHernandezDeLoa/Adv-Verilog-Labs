In this lab we will be building the early detection scheme. When the
input changes from 0 to 1, the FSM responds immediately. The FSM then ignores the input for
about 20 ms to avoid glitches. After this amount of time, the FSM starts to check the input for
the falling edge. Follow the FSM design procedure to design the early debouncing scheme.

1. Derive the state diagram and ASM chart for the circuit.
2. Derive the HDL code based on the state diagram and/or ASM chart.
3. Derive a testbench and use simulation to verify operation of the code.
4. Show the switch signal and the debounced signal on the oscilloscope.

<img width="1003" alt="image" src="https://github.com/user-attachments/assets/e830018e-05e3-48c5-9e4f-f7acd77501df" />
 
<img width="1054" alt="image" src="https://github.com/user-attachments/assets/d110c157-838b-4d23-9326-8d910813505c" /> ////don't know it this is necessary....


