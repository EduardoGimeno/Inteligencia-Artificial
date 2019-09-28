// Bayesian Network
//   Elvira format 

bnet  "Car-Starts" { 

// Network Properties

version = 1.0;
default node states = (absent , present);

// Network Variables 

node "Alternator"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =47;
pos_y =42;
relevance = 7.0;
num-states = 2;
states = ("Ok" "Faulted");
}

node "FanBelt"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =154;
pos_y =42;
relevance = 7.0;
num-states = 3;
states = ("Ok" "Slipping" "Broken");
}

node "Leak"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =245;
pos_y =43;
relevance = 7.0;
num-states = 2;
states = ("Leak" "NoLeak");
}

node "Charge"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =137;
pos_y =125;
relevance = 7.0;
num-states = 2;
states = ("Good" "Low");
}

node "BatteryAge"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =384;
pos_y =42;
relevance = 7.0;
num-states = 2;
states = ("New" "Old");
}

node "BatteryState"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =371;
pos_y =122;
relevance = 7.0;
num-states = 2;
states = ("Ok" "Weak");
}

node "BatteryPower"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =248;
pos_y =197;
relevance = 7.0;
num-states = 2;
states = ("Good" "Poor");
}

node "GasInTank"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =404;
pos_y =198;
relevance = 7.0;
num-states = 2;
states = ("Gas" "NoGas");
}

node "GasGauge"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =326;
pos_y =247;
relevance = 7.0;
num-states = 2;
states = ("Gas" "NoGas");
}

node "Lights"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =137;
pos_y =203;
relevance = 7.0;
num-states = 2;
states = ("Work" "NoLight");
}

node "Radio"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =165;
pos_y =252;
relevance = 7.0;
num-states = 2;
states = ("Works" "Dead");
}

node "Starter"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =177;
pos_y =317;
relevance = 7.0;
num-states = 2;
states = ("Ok" "Faulted");
}

node "Leak2"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =331;
pos_y =315;
relevance = 7.0;
num-states = 2;
states = ("True" "False");
}

node "EngineCranks"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =248;
pos_y =363;
relevance = 7.0;
num-states = 2;
states = ("Cranks" "NoCrank");
}

node "FuelPump"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =186;
pos_y =446;
relevance = 7.0;
num-states = 2;
states = ("Ok" "Faulted");
}

node "Distributor"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =201;
pos_y =506;
relevance = 7.0;
num-states = 2;
states = ("Ok" "Faulted");
}

node "SparkPlugs"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =264;
pos_y =547;
relevance = 7.0;
num-states = 2;
states = ("Ok" "Bad");
}

node "Starts"(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =307;
pos_y =443;
relevance = 7.0;
num-states = 2;
states = ("Yes" "No");
}

// links of the associated graph:

link "Alternator" "Charge";

link "FanBelt" "Charge";

link "Leak" "Charge";

link "BatteryAge" "BatteryState";

link "Charge" "BatteryPower";

link "BatteryState" "BatteryPower";

link "BatteryPower" "GasGauge";

link "GasInTank" "GasGauge";

link "BatteryPower" "Lights";

link "BatteryPower" "Radio";

link "BatteryPower" "EngineCranks";

link "Starter" "EngineCranks";

link "Leak2" "EngineCranks";

link "EngineCranks" "Starts";

link "FuelPump" "Starts";

link "Distributor" "Starts";

link "SparkPlugs" "Starts";

//Network Relationships: 

relation "Alternator" { 
values= table (0.9995 5.0E-4 );
}

relation "FanBelt" { 
values= table (0.995 0.0020 0.0030 );
}

relation "Leak" { 
values= table (1.0E-4 0.9999 );
}

relation "Charge" "Alternator" "FanBelt" "Leak" { 
values= table (0.0 1.0 0.0 0.0 0.0 0.0 0.5 0.5 0.5 0.5 0.5 0.5 1.0 0.0 1.0 1.0 1.0 1.0 0.5 0.5 0.5 0.5 0.5 0.5 );
}

relation "BatteryAge" { 
values= table (0.7 0.3 );
}

relation "BatteryState" "BatteryAge" { 
values= table (0.99 0.8 0.01 0.2 );
}

relation "BatteryPower" "Charge" "BatteryState" { 
values= table (1.0 0.0 0.0 0.0 0.0 1.0 1.0 1.0 );
}

relation "GasInTank" { 
values= table (0.5 0.5 );
}

relation "GasGauge" "BatteryPower" "GasInTank" { 
values= table (1.0 0.0 0.2 0.0 0.0 1.0 0.8 1.0 );
}

relation "Lights" "BatteryPower" { 
values= table (0.9 0.0 0.1 1.0 );
}

relation "Radio" "BatteryPower" { 
values= table (0.9 0.1 0.1 0.9 );
}

relation "Starter" { 
values= table (0.99 0.01 );
}

relation "Leak2" { 
values= table (1.0E-4 0.9999 );
}

relation "EngineCranks" "BatteryPower" "Starter" "Leak2" { 
values= table (0.0 1.0 0.0 0.0 0.0 0.2 0.0 0.0 1.0 0.0 1.0 1.0 1.0 0.8 1.0 1.0 );
}

relation "FuelPump" { 
values= table (0.999 0.0010 );
}

relation "Distributor" { 
values= table (0.999 0.0010 );
}

relation "SparkPlugs" { 
values= table (0.9998 2.0E-4 );
}

relation "Starts" "EngineCranks" "FuelPump" "Distributor" "SparkPlugs" { 
values= table (1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 );
}

}
