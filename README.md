# SAR ADC Digital Control Logic  
**RTL → GDS ASIC Implementation**

![SystemVerilog](https://img.shields.io/badge/SystemVerilog-RTL-blue)
![ASIC](https://img.shields.io/badge/ASIC-RTL--to--GDS-green)
![Synopsys](https://img.shields.io/badge/Tools-Synopsys-orange)
![Node](https://img.shields.io/badge/Node-90nm-red)

---

## Overview
This repository contains a **full ASIC implementation** of a **10-bit, 100 MSps Successive Approximation Register (SAR) ADC digital control block**, taken from **SystemVerilog RTL to final GDS** using an industry-standard Synopsys flow.

The design was developed as a final project for **CND211** and follows real-world sign-off practices including **MCMM STA, formal verification, and post-route timing closure**.

---

## Key Specs
| Feature | Value |
|------|------|
| Resolution | 10-bit |
| Sampling Rate | 100 MSps |
| System Clock | 1.1 GHz |
| Technology | SAED 90 nm (LVT) |
| Flow | RTL → Synthesis → P&R → GDS |
| Verification | E2E SV TB + Formal |

---

## Architecture
The SAR control logic consists of:
- **Set Propagator** for conversion sequencing
- **Custom SAR Register** with asynchronous set/reset behavior

Each conversion completes in **ADC_RESOLUTION + 1 cycles**.

### Top-Level Interface
| Signal | Dir | Width | Description |
|------|----|------|------------|
| `i_clk` | In | 1 | 1.1 GHz system clock |
| `i_start` | In | 1 | Start conversion |
| `i_comp` | In | 1 | Comparator output |
| `o_eoc` | Out | 1 | End of conversion |
| `o_a2d` | Out | 10 | Digital output code |

---

## Verification
A **class-based SystemVerilog end-to-end testbench** was built, including:
- Randomized stimulus generation
- Behavioral analog comparator model
- DAC-based output checking (±1 LSB tolerance)
- Functional coverage over full input range

Coverage achieved is sufficient for sign-off, with minor loss due to verbosity-controlled debug logic.

---

## Linting
Linting was performed using **Synopsys SpyGlass**:
- RTL
- RTL Enhanced
- RTL Turbo

Some reported violations (e.g. FF-driven clocks, async set usage) are **intentional and architecture-required**, and were reviewed and waived.

---

## Synthesis & STA
- Tool: **Synopsys Design Compiler**
- PDK: **SAED 90 nm (LVT cells)**
- Mode: **MCMM**

Results:
- **No setup or hold violations**
- Critical path slack ≈ **90 ps**
- Design intentionally minimizes logic depth to meet 1.1 GHz

---

## Formal Verification
- Tool: **Synopsys Formality**
- RTL vs netlist equivalence

One known mismatch due to an FF with constant clock was resolved using `set_dont_verify`.  
Final result: **Formal equivalence PASSED**.

---

## Physical Design
Implemented using **Synopsys IC Compiler II**.

### Flow
1. NDM library generation (LVT fixes)
2. Floorplanning (28 µm × 28 µm)
3. Power mesh insertion
4. Placement
5. Clock Tree Synthesis
6. Routing & fillers
7. Sign-off STA (PrimeTime)

### Sign-Off
- No timing violations
- IR drop and EM within limits
- **Final GDS generated**

---

## Tools Used
- Synopsys VCS
- Synopsys SpyGlass
- Synopsys Design Compiler
- Synopsys Formality
- Synopsys IC Compiler II
- Synopsys PrimeTime

---

## Project Structure
```text
├── hdl/        # Synthesizable SystemVerilog
├── ver/        # Class-based verification environment
├── impl/       # ASIC backend scripts
└── intf/       # SystemVerilog Interfaces
