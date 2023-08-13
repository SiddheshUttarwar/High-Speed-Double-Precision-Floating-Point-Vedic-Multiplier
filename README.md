# High-Speed-Double-Precision-Floating-Point-Vedic-Multiplier

## Table of Contents

- [Abstract](#Abstract)
- [Proposed Model](#proposedModel)
- [Algorithm](#Algorithm)

## Abstract

In the field of digital signal processing, multiplication and addition operations involving
floating-point numbers are crucial. To achieve efficient performance while reducing on-chip
area and memory consumption, it is necessary to design a multiplication algorithm that
minimizes delay and area consumption. This thesis proposes a method for multiplying
double-precision floating-point numbers using Vedic mathematics. The proposed algorithm
involves three steps: sign generation, exponent generation, and mantissa multiplication. The
Urdhav-trayagbhaym sutra is used for mantissa multiplication due to its efficiency and
reduced space consumption compared to other multiplication algorithms. This thesis also
proposes the algorithm to multiply prime bit Vedic multiplication. The proposed multiplier is
implemented in Verilog HDL, and simulations and synthesis are conducted using Vivado
2022.2 software. The results demonstrate that the proposed algorithm outperforms existing
algorithms and floating-point Vedic multipliers, with reduced delay, power consumption, and
space utilization.

## proposedModel

![image](https://github.com/SiddheshUttarwar/High-Speed-Double-Precision-Floating-Point-Vedic-Multiplier/assets/69843720/deb8d8f0-0165-43b5-a073-57593240a892)


## Algorithm
A = ±1.M1*(2^E1) , 
B = ±1.M2*(2^E2) 
A = {S1[63] , E1[62:52] , M1[51:0] }
B = {S2[63] , E2[62:52] , M2[51:0] }
M= {S3[63] , E3[62:52] , M3[51:0] }
P[105:0] = { 1 , A[51:0] } * { 1 , B[51:0] }
E = A[62:52] + B[62:52] – 11’d1023
The inputs to normalizer are E and P and outputs are exponent (NE-11 BITS) and mantissa (NM-52 BITS)
M[51:0] = NM , 
M[62:52] = NE , 
M[63] = A[63] XOR B[63]

