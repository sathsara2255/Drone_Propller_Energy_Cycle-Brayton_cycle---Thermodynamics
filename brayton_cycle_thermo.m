

% --- GIVEN PARAMETERS --------------------------------------
gamma = 1.4;          % Ratio of specific heats for air
cp = 1005;            % Specific heat at constant pressure [J/kg·K]
R = 287;              % Gas constant [J/kg·K]

T1 = 288;             % K - Inlet temperature (ambient ~15°C)
P1 = 101325;          % Pa - Inlet pressure (1 atm)
rp = 8;               % Compressor pressure ratio (P2/P1)
eta_c = 0.85;         % Compressor efficiency
eta_t = 0.90;         % Turbine efficiency
Tmax = 1100;          % K - Maximum cycle temperature (combustor exit)

% --- 1. ISENTROPIC COMPRESSION ------------------------------
P2 = rp * P1;         % Compressor outlet pressure
T2s = T1 * (rp)^((gamma-1)/gamma);   % Isentropic outlet T
T2 = T1 + (T2s - T1)/eta_c;          % Actual outlet T

% --- 2. CONSTANT PRESSURE HEAT ADDITION ---------------------
T3 = Tmax;             % Combustion chamber exit T
P3 = P2;               % Constant pressure

% --- 3. ISENTROPIC EXPANSION -------------------------------
% Find P4 using pressure ratio equal to P1
P4 = P1;
T4s = T3 * (P4/P3)^((gamma-1)/gamma);
T4 = T3 - eta_t*(T3 - T4s);

% --- 4. CALCULATE WORKS AND HEATS ---------------------------
Wc = cp*(T2 - T1);           % Compressor work (J/kg)
Wt = cp*(T3 - T4);           % Turbine work (J/kg)
Qin = cp*(T3 - T2);          % Heat added (J/kg)
Qout = cp*(T4 - T1);         % Heat rejected (J/kg)
Wnet = Wt - Wc;              % Net work output (J/kg)
eta_th = Wnet / Qin;         % Thermal efficiency

% --- 5. DISPLAY RESULTS ------------------------------------
fprintf('--- Brayton Cycle (Drone Propeller Energy Cycle) ---\n');
fprintf('Compressor Pressure Ratio: %.2f\n', rp);
fprintf('T1 = %.1f K | T2 = %.1f K | T3 = %.1f K | T4 = %.1f K\n', T1,T2,T3,T4);
fprintf('Net Work = %.1f kJ/kg\n', Wnet/1000);
fprintf('Thermal Efficiency = %.2f %%\n', eta_th*100);
fprintf('---------------------------------------------------\n');

% --- 6. PLOT T-s AND P-v DIAGRAMS ---------------------------

% Entropy changes (approx using ideal gas relations)
s12 = cp*log(T2/T1) - R*log(P2/P1);
s23 = cp*log(T3/T2);
s34 = cp*log(T4/T3) - R*log(P4/P3);
s41 = cp*log(T1/T4);

s1 = 0;
s2 = s1 + s12;
s3 = s2 + s23;
s4 = s3 + s34;

T = [T1 T2 T3 T4 T1];
s = [s1 s2 s3 s4 s1];

% Plot 1: Temperature–Entropy (T–s) diagram
figure(1)
plot(s, T, '-o','LineWidth',2)
xlabel('Entropy (J/kg·K)')
ylabel('Temperature (K)')
title('Brayton Cycle - T–s Diagram (Drone Propeller Energy Cycle)')
grid on
text(s1, T1, '1 (Inlet)','VerticalAlignment','bottom')
text(s2, T2, '2 (After Compression)','VerticalAlignment','bottom')
text(s3, T3, '3 (After Combustion)','VerticalAlignment','bottom')
text(s4, T4, '4 (After Expansion)','VerticalAlignment','top')

% Approximate specific volume at each state
v1 = R*T1/P1;
v2 = R*T2/P2;
v3 = R*T3/P3;
v4 = R*T4/P4;
v = [v1 v2 v3 v4 v1];
P = [P1 P2 P3 P4 P1];

% Plot 2: Pressure–Volume (P–v) diagram
figure(2)
plot(v, P/1000, '-s','LineWidth',2)
xlabel('Specific Volume (m^3/kg)')
ylabel('Pressure (kPa)')
title('Brayton Cycle - P–v Diagram (Drone Propeller Energy Cycle)')
grid on
text(v1, P1/1000, '1')
text(v2, P2/1000, '2')
text(v3, P3/1000, '3')
text(v4, P4/1000, '4')

% Plot 3: Work vs Heat flow (bar chart)
figure(3)
bar([Wc/1000, Wt/1000, Wnet/1000])
set(gca,'XTickLabel',{'Wc (Compressor)','Wt (Turbine)','Wnet'})
ylabel('Energy per kg (kJ/kg)')
title('Work Distribution in Drone Brayton Cycle')
grid on

% Plot 4: Temperature profile
figure(4)
states = [1 2 3 4 1];
plot(states,[T1 T2 T3 T4 T1],'-^','LineWidth',2)
xlabel('Cycle Stage')
ylabel('Temperature (K)')
title('Temperature Profile of Brayton Cycle')
grid on
