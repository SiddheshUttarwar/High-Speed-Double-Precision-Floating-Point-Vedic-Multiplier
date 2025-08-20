# ⚡ High-Speed Double Precision Floating Point Vedic Multiplier

A **high-performance Vedic multiplier** implementation using **double-precision floating-point arithmetic**, designed and optimized in **Verilog HDL**.  
This project leverages **Vedic Mathematics Sutras** for faster multiplication, resulting in reduced delay, improved area utilization, and lower power consumption compared to conventional multipliers.

---

## 🚀 Features
- ✅ **Double Precision Floating Point Support** (64-bit IEEE 754 format)  
- ✅ **Optimized Vedic Sutra Implementation** for high-speed multiplication  
- ✅ **Improved Delay & Power Efficiency** compared to standard multipliers  
- ✅ **Prime Bit Multiplier Architecture** designed and published for patent  
- ✅ Fully **synthesizable Verilog code** and testbenches  

---

## 📂 Technology Stack
- **Language:** Verilog HDL  
- **Simulation Tool:** Xilinx Vivado 2022.2  
- **Design Focus:** High-speed arithmetic circuits (VLSI)  
- **Application:** Digital Signal Processing, Scientific Computing, AI/ML Accelerators  

---

## 🏆 Patent & Recognition
🔹 Designed and implemented a **Prime Bit Vedic Multiplier** architecture.  
🔹 Published patent with the **Intellectual Property Rights (IPR) Cell**.  
🔹 Academic project aligned with **cutting-edge VLSI research** in arithmetic circuits.  

---

## 🧩 Final Architecture Algorithm (Double Precision Floating Point Vedic Multiplier)

1. **Input Representation**  
   - Accepts two **64-bit double precision floating-point numbers** (IEEE 754 format).  
   - Extracts **sign bit, exponent, and mantissa** from both inputs.  

2. **Exponent Calculation**  
   - Adds the exponents of the two numbers.  
   - Normalizes with **bias adjustment** for IEEE 754 compliance.  

3. **Mantissa Multiplication**  
   - Multiplies mantissas using **Urdhva Tiryagbhyam Sutra (Vertical & Crosswise)**.  
   - Generates partial products in parallel for reduced delay.  

4. **Normalization**  
   - If the product mantissa exceeds the range, shift right and adjust the exponent.  

5. **Sign Determination**  
   - If inputs have the same sign → result is positive.  
   - Otherwise → result is negative.  

6. **Result Packing**  
   - Combine **sign, exponent, and mantissa** into IEEE 754 double precision format.  

---

## 🔑 Prime Bit Vedic Multiplier Algorithm (Patented)

1. **Prime Bit Decomposition**  
   - Split the input operands into smaller **prime-sized bit groups** (e.g., 2, 3, 5-bit groups).  
   - Ensures efficient partial product generation.  

2. **Hierarchical Vedic Multiplication**  
   - Apply **Urdhva Tiryagbhyam Sutra** within each prime group.  
   - Perform recursive combination for higher-order bits.  

3. **Carry Propagation Optimization**  
   - Uses **hybrid adders** to reduce carry delay.  
   - Balances power and performance with pipelining.  

4. **Result Construction**  
   - Merge partial results from prime bit groups.  
   - Normalize and adjust sign/exponent (for floating-point use).  

5. **Efficiency Gains**  
   - Lower **area complexity**  
   - Reduced **propagation delay**  
   - Improved **power efficiency**  

---

## 📊 Performance Highlights
- **Delay Reduction:** Faster than conventional multipliers due to parallelism.  
- **Area Efficiency:** Optimized gate-level structure.  
- **Power Savings:** Less switching activity in partial product accumulation.  

---

## 📖 Applications
- High-speed **DSP systems**  
- **AI/ML accelerators** needing efficient multiplication  
- **Graphics processing units (GPUs)**  
- **Scientific computation** & large-scale numerical methods  
