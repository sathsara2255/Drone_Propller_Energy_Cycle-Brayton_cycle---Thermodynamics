# Drone_Propller_Energy_Cycle-Brayton_cycle---Thermodynamics
The Brayton Cycle is a thermodynamic cycle that describes the operation of gas turbines — engines that burn fuel to produce a high-speed flow of air, which then drives a turbine and provides thrust or mechanical power.

Drone Propeller Energy Cycle (Brayton Cycle)

This repository models the energy conversion in a small drone powered by a gas-turbine engine (Brayton cycle). The cycle consists of four main processes: isentropic compression in the compressor, constant-pressure heat addition in the combustor, isentropic expansion in the turbine, and heat rejection to the environment. The turbine work drives both the compressor and the drone’s propeller. The code calculates state variables (temperature, pressure, specific volume, entropy), turbine and compressor work, net work, heat flows, and thermal efficiency. T–s (Temperature–Entropy) and P–v (Pressure–Volume) diagrams illustrate the cycle, and equations include real efficiencies for compressor and turbine. This provides a clear example of how chemical energy from fuel is converted into aerodynamic thrust for drone propulsion. 

Assumptions

Working fluid: air (ideal gas)

Constant specific heats (
𝑐
𝑝
)

Negligible kinetic and potential energy changes

The turbine drives both the compressor and the propeller shaft

Propeller converts turbine shaft work into thrust with efficiency 
(𝜂
𝑝)
	
Four Main Processes and Equations

(1) Isentropic Compression (1 → 2)

The air is compressed in the compressor, increasing pressure and temperature.

Equations:

Isentropic temperature rise:

𝑇
(2
𝑠) =
𝑇
(1)
(
𝑃
(2)/
𝑃
(1)
)^(
𝛾
−
1
)
/
𝛾

Actual temperature accounting for compressor efficiency 
(𝜂
𝑐)

𝑇
(2) =
𝑇
(1)
+
[ 𝑇
(2)
𝑠
−
𝑇
(1)/
𝜂
𝑐 ]

Compressor work per unit mass:

𝑊
𝑐 =
C
𝑝
(
 𝑇
(2)
𝑠
−
𝑇
(1))

Entropy change:

Δ
𝑠
(1)
→
(2) =
C
𝑝
ln [
𝑇
(2)/
𝑇
(1) ]
−
𝑅
ln [
𝑃
(2)/
𝑃
(1) ]

The compressor requires energy input. A real compressor is not perfectly efficient, so the actual exit temperature is higher than the ideal isentropic value.


(2) Constant-Pressure Heat Addition (2 → 3)

Air enters the combustor, fuel burns, and heat is added at constant pressure

Heat added per kg of air:

𝑄
𝑖
𝑛 =
C
𝑝
(
𝑇
(3)
−
𝑇
(2)
)

Pressure remains approximately constant:

𝑃
3 =
𝑃
2

Entropy change:

Δ
𝑠
(2)
→
(3) =
C
𝑝
ln [
𝑇
(3)/
𝑇
(2) ]

Temperature rises sharply due to fuel combustion. This is the energy input that will later produce work in the turbine.


(3) Isentropic Expansion in Turbine (3 → 4)

Hot gases expand in the turbine, performing mechanical work.

Isentropic turbine exit temperature
𝑇
(4
𝑠) =
𝑇
(3)
(
𝑃
(4)/
𝑃
(3)
)^(
𝛾
−
1
)
/
𝛾

Actual turbine temperature with efficiency 
(𝜂
𝑡)


𝑇
(4) =
𝑇
(3) -
𝜂
t
[ 𝑇
(2)
𝑠
−
𝑇
(1)
 ]

Turbine work per kg

𝑊
t =
C
𝑝
(
 𝑇
(3)
𝑠
−
𝑇
(4))

Entropy change

Δ
𝑠
(3)
→
(4) =
C
𝑝
ln [
𝑇
(4)/
𝑇
(3) ]
−
𝑅
ln [
𝑃
(4)/
𝑃
(3) ]

The turbine extracts energy from the hot gases. Part of the turbine work drives the compressor; the remaining work is available to drive the propeller.

(4) Constant-Pressure Heat Rejection (4 → 1)

Heat rejected per kg of air

𝑄
out =
C
𝑝
(
𝑇
(4)
−
𝑇
(1)
)

Entropy change

Δ
𝑠
(4)
→
(1) =
C
𝑝
ln [
𝑇
(1)/
𝑇
(4) ]
−
𝑅
ln [
𝑃
(1)/
𝑃
(4) ]

Net Work and Efficiency

Net work per kg of air (available for propeller)

Wnet​=Wt​−Wc​

Thermal efficiency of the Brayton cycle

ηth​ = Wnet​/Qin​

Propeller converts turbine work to thrust power with efficiency 
(𝜂
𝑝)

Pthrust ​= ηp​Wnet ​⋅ m˙

Overall energy efficiency

ηoverall ​= ηth . ηp​

Ideal Gas Relations for State Variables

Pressure, temperature, and specific volume

vi​ = RTi/Pi​​​

Entropy relative to a reference

Si​ = Sref​ + Cp​ln[Ti/Tref​]​​−Rln[Pi/Pref]


TERMS

Compressor work = 
𝑊
𝑐​

Turbine work =
𝑊
𝑡

Net work =
𝑊
𝑛
𝑒
𝑡
​
Heat added =
𝑄
𝑖
𝑛

Heat rejected =
𝑄
𝑜
𝑢
𝑡

Thermal efficiency =
𝜂
𝑡
ℎ

Propeller efficiency =
𝜂
𝑝

Overall efficiency =
𝜂
𝑜
𝑣
𝑒
𝑟
𝑎
𝑙
𝑙

T–s Diagram (Temperature–Entropy)

The T–s diagram is one of the most important ways to visualize the thermodynamics of the Brayton cycle. It plots temperature (T) on the vertical axis versus entropy (s) on the horizontal axis.

1 → 2: Compressor (Isentropic Compression)

In an ideal cycle, this would be a vertical line because entropy is constant

Real compressors have inefficiencies (nc <1) so entropy slightly increases, producing a line sloping right and up.

Temperature rises significantly, representing the energy input needed to compress air.


2 → 3: Combustor (Constant-Pressure Heat Addition)

The line moves mostly horizontally to the right because pressure remains constant while entropy increases sharply.

Temperature rises dramatically (from ~500–600 K to ~1100 K in micro-turbine drones).

Physical Meaning: This segment represents fuel combustion, adding thermal energy to the air.


3 → 4: Turbine (Isentropic Expansion)

Ideally a vertical line downward (entropy constant), but real turbines(nc <1) have slight rightward slope due to inefficiency.

Temperature drops significantly, representing the energy extracted to drive the compressor and the propeller.


4 → 1: Heat Rejection

The cycle closes by releasing waste heat to the environment at nearly constant pressure, causing entropy to decrease slightly, depending on assumptions.

Temperature returns to ambient.



Interpretation for Drones

A higher turbine inlet temperature (T3) increases the height of the 2→3 vertical segment → higher net work → more propeller power.

Higher compressor efficiency makes 1→2 closer to vertical → less extra work input, higher net efficiency.

This diagram helps visualize where energy is added, extracted, and lost in a drone turbine system.

The T–s and P–v diagrams visualize the four processes of a Brayton cycle in a micro-turbine drone engine. The T–s diagram shows temperature vs. entropy: vertical lines indicate compression and expansion, horizontal lines indicate heat addition and rejection. The area enclosed corresponds to net work per kg of air. The P–v diagram shows pressure vs. specific volume: compression moves left/up, expansion moves right/down, and heat addition/rejection occurs at nearly constant pressure. These diagrams are essential to understand energy flows, losses, and how turbine work is converted to propeller thrust in a drone system.


