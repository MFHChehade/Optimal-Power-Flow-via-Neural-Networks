# DC-OPF-using-ANNs
This is the first part of my final year capstone design project. The projects aims to solve the optimal power flow (OPF) problem using feed-forward artificial neural networks (ANNs). The use of ANNs is to accelerate the time needed to solve the problem. 

The first step is to generate data using MATLAB. The data is generated using the MATPOWER solver. The pseudocode for the data generation can be found in the report. One has to run only the generateSheet.m file. This file calls the other 3 MATLAB files. It is assumed that MATPOWER is installed for the user.

After running the MATLAB code, a spreadsheet is created. This spreadsheet is used by the Python code found in the Jupyter notebook. This code is used to solve for the power generation. From there on, the phase angles can be deduced by solving the load flow problem. 
