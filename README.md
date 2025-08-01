# APB Protocol implementation

This is a simple implementation of the **Advanced Peripheral Bus (APB)** protocol using Verilog HDL. It features a **single master** and **single slave** setup, adhering to the AMBA APB specifications.

---

## 🧠 Overview

The **APB** is part of the AMBA (Advanced Microcontroller Bus Architecture) family by ARM. It is a low-power, simple bus interface typically used to connect peripheral devices like timers, UARTs, and GPIOs.

This repository focuses on:
- Designing a Verilog-based **APB master** that initiates read and write operations.
- Implementing a **Verilog APB slave** that responds with appropriate read/write behavior.
- Basic **testbench** for functional simulation.

---



