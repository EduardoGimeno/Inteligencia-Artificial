//	   Network
//	   Elvira format

bnet "insurance.elv" {

//		 Network Properties

comment = "";
default node states = ("absent" , "present");

// Variables

node GoodStudent(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =1232;
pos_y =176;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("True" "False");
}

node Age(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =949;
pos_y =51;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Adolescent" "Adult" "Senior");
}

node SocioEcon(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =636;
pos_y =63;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Prole" "Middle" "UpperMiddle" "Wealthy");
}

node RiskAversion(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =805;
pos_y =263;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Psychopath" "Adventurous" "Normal" "Cautious");
}

node VehicleYear(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =158;
pos_y =321;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("Current" "Older");
}

node ThisCarDam(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =515;
pos_y =754;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("None" "Mild" "Moderate" "Severe");
}

node RuggedAuto(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =505;
pos_y =605;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("EggShell" "Football" "Tank");
}

node Accident(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =285;
pos_y =698;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("None" "Mild" "Moderate" "Severe");
}

node MakeModel(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =513;
pos_y =458;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("SportsCar" "Economy" "FamilySedan" "Luxury" "SuperLuxury");
}

node DrivQuality(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =1162;
pos_y =460;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Poor" "Normal" "Excellent");
}

node Mileage(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =338;
pos_y =46;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("FiveThou" "TwentyThou" "FiftyThou" "Domino");
}

node Antilock(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =304;
pos_y =578;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("True" "False");
}

node DrivingSkill(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =1264;
pos_y =334;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("SubStandard" "Normal" "Expert");
}

node SeniorTrain(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =1044;
pos_y =249;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("True" "False");
}

node ThisCarCost(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =532;
pos_y =863;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Thousand" "TenThou" "HundredThou" "Million");
}

node Theft(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =936;
pos_y =854;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("True" "False");
}

node CarValue(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =752;
pos_y =668;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("FiveThou" "TenThou" "TwentyThou" "FiftyThou" "Million");
}

node HomeBase(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =1183;
pos_y =726;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Secure" "City" "Suburb" "Rural");
}

node AntiTheft(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =989;
pos_y =724;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("True" "False");
}

node PropCost(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =318;
pos_y =937;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Thousand" "TenThou" "HundredThou" "Million");
}

node OtherCarCost(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =321;
pos_y =804;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Thousand" "TenThou" "HundredThou" "Million");
}

node OtherCar(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =204;
pos_y =148;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("True" "False");
}

node MedCost(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =76;
pos_y =714;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Thousand" "TenThou" "HundredThou" "Million");
}

node Cushioning(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =96;
pos_y =535;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Poor" "Fair" "Good" "Excellent");
}

node Airbag(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =124;
pos_y =451;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("True" "False");
}

node ILiCost(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =83;
pos_y =881;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Thousand" "TenThou" "HundredThou" "Million");
}

node DrivHist(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =1423;
pos_y =477;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Zero" "One" "Many");
}

//		 Links of the associated graph:

link Age GoodStudent;

link Age SocioEcon;

link Age RiskAversion;

link Age DrivingSkill;

link Age SeniorTrain;

link Age MedCost;

link SocioEcon GoodStudent;

link SocioEcon RiskAversion;

link SocioEcon VehicleYear;

link SocioEcon MakeModel;

link SocioEcon HomeBase;

link SocioEcon AntiTheft;

link SocioEcon OtherCar;

link RiskAversion VehicleYear;

link RiskAversion MakeModel;

link RiskAversion DrivQuality;

link RiskAversion SeniorTrain;

link RiskAversion HomeBase;

link RiskAversion AntiTheft;

link RiskAversion DrivHist;

link VehicleYear RuggedAuto;

link VehicleYear Antilock;

link VehicleYear CarValue;

link VehicleYear Airbag;

link ThisCarDam ThisCarCost;

link RuggedAuto ThisCarDam;

link RuggedAuto OtherCarCost;

link RuggedAuto Cushioning;

link Accident ThisCarDam;

link Accident OtherCarCost;

link Accident MedCost;

link Accident ILiCost;

link MakeModel RuggedAuto;

link MakeModel Antilock;

link MakeModel CarValue;

link MakeModel Airbag;

link DrivQuality Accident;

link Mileage Accident;

link Mileage CarValue;

link Antilock Accident;

link DrivingSkill DrivQuality;

link DrivingSkill DrivHist;

link SeniorTrain DrivingSkill;

link ThisCarCost PropCost;

link Theft ThisCarCost;

link CarValue ThisCarCost;

link CarValue Theft;

link HomeBase Theft;

link AntiTheft Theft;

link OtherCarCost PropCost;

link Cushioning MedCost;

link Airbag Cushioning;

//		Network Relationships:

relation GoodStudent SocioEcon Age {
values = table(0.1 0.0 0.0 0.2 0.0 0.0 0.5 0.0 0.0 0.4 0.0 0.0 0.9 1.0 1.0 0.8 1.0 1.0 0.5 1.0 
1.0 0.6 1.0 1.0 );
}

relation Age {
values = table(0.2 0.6 0.2 );
}

relation SocioEcon Age {
values = table(0.4 0.4 0.5 0.4 0.4 0.2 0.19 0.19 0.29 0.01 0.01 0.01 );
}

relation RiskAversion Age SocioEcon {
values = table(0.02 0.02 0.02 0.02 0.015 0.015 0.015 0.015 0.01 0.01 0.01 0.01 0.58 0.38 0.48 0.58 0.285 0.185 0.285 0.285 
0.09 0.04 0.09 0.09 0.3 0.5 0.4 0.3 0.5 0.6 0.5 0.4 0.4 0.35 0.4 0.4 0.1 0.1 0.1 0.1 
0.2 0.2 0.2 0.3 0.5 0.6 0.5 0.5 );
}

relation VehicleYear SocioEcon RiskAversion {
values = table(0.15 0.15 0.15 0.15 0.3 0.3 0.3 0.3 0.8 0.8 0.8 0.8 0.9 0.9 0.9 0.9 0.85 0.85 0.85 0.85 
0.7 0.7 0.7 0.7 0.2 0.2 0.2 0.2 0.1 0.1 0.1 0.1 );
}

relation ThisCarDam Accident RuggedAuto {
values = table(1.0 1.0 1.0 0.001 0.2 0.7 1.0E-6 0.001 0.05 1.0E-6 1.0E-6 0.05 0.0 0.0 0.0 0.9 0.75 0.29 9.99E-4 0.099 
0.6 9.0E-6 9.99E-4 0.2 0.0 0.0 0.0 0.098 0.049999 0.009999 0.7 0.8 0.3 9.0E-5 0.009 0.2 0.0 0.0 0.0 0.001 
1.0E-6 1.0E-6 0.299 0.1 0.05 0.9999 0.99 0.55 );
}

relation RuggedAuto MakeModel VehicleYear {
values = table(0.95 0.95 0.5 0.9 0.2 0.05 0.1 0.1 0.05 0.05 0.04 0.04 0.5 0.1 0.6 0.55 0.6 0.6 0.55 0.55 
0.01 0.01 0.0 0.0 0.2 0.4 0.3 0.3 0.4 0.4 );
}

relation Accident Antilock Mileage DrivQuality {
values = table(0.7 0.99 0.999 0.4 0.98 0.995 0.3 0.97 0.99 0.2 0.95 0.985 0.6 0.98 0.995 0.3 0.96 0.99 0.2 0.95 
0.98 0.1 0.94 0.98 0.2 0.007 7.0E-4 0.3 0.01 0.003 0.3 0.02 0.007 0.2 0.03 0.01 0.2 0.01 0.003 0.2 
0.02 0.007 0.2 0.03 0.01 0.1 0.03 0.01 0.07 0.002 2.0E-4 0.2 0.005 0.001 0.2 0.007 0.002 0.3 0.01 0.003 
0.1 0.005 0.001 0.2 0.015 0.002 0.2 0.015 0.005 0.3 0.02 0.007 0.03 0.001 1.0E-4 0.1 0.005 0.001 0.2 0.003 
0.001 0.3 0.01 0.002 0.1 0.005 0.001 0.3 0.005 0.001 0.4 0.005 0.005 0.5 0.01 0.003 );
}

relation MakeModel SocioEcon RiskAversion {
values = table(0.1 0.1 0.1 0.1 0.15 0.15 0.15 0.15 0.2 0.2 0.2 0.2 0.3 0.3 0.3 0.3 0.7 0.7 0.7 0.7 
0.2 0.2 0.2 0.2 0.05 0.05 0.05 0.05 0.01 0.01 0.01 0.01 0.2 0.2 0.2 0.2 0.65 0.65 0.65 0.65 
0.3 0.3 0.3 0.3 0.09 0.09 0.09 0.09 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.45 0.45 0.45 0.45 
0.4 0.4 0.4 0.4 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.2 0.2 0.2 0.2
 );
}

relation DrivQuality DrivingSkill RiskAversion {
values = table(1.0 1.0 1.0 1.0 0.5 0.3 0.0 0.0 0.3 0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.2 0.4 1.0 0.8 
0.2 0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.3 0.3 0.0 0.2 0.5 0.98 1.0 1.0 );
}

relation Mileage {
values = table(0.1 0.4 0.4 0.1 );
}

relation Antilock MakeModel VehicleYear {
values = table(0.9 0.1 0.001 0.0 0.4 0.0 0.99 0.3 0.99 0.15 0.1 0.9 0.999 1.0 0.6 1.0 0.01 0.7 0.01 0.85
 );
}

relation DrivingSkill Age SeniorTrain {
values = table(0.5 0.5 0.3 0.3 0.1 0.4 0.45 0.45 0.6 0.6 0.6 0.5 0.05 0.05 0.1 0.1 0.3 0.1 );
}

relation SeniorTrain Age RiskAversion {
values = table(0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0E-6 1.0E-6 0.3 0.9 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 
0.999999 0.999999 0.7 0.1 );
}

relation ThisCarCost ThisCarDam CarValue Theft {
values = table(0.2 1.0 0.05 1.0 0.04 1.0 0.04 1.0 0.04 1.0 0.15 0.95 0.03 0.95 0.03 0.99 0.03 0.99 0.02 0.98 
0.05 0.25 0.01 0.15 0.001 0.01 0.001 0.005 0.001 0.003 0.03 0.05 1.0E-6 0.01 1.0E-6 0.005 1.0E-6 0.001 1.0E-6 1.0E-6 
0.8 0.0 0.95 0.0 0.01 0.0 0.01 0.0 0.01 0.0 0.85 0.05 0.97 0.05 0.02 0.01 0.02 0.01 0.03 0.01 
0.95 0.75 0.99 0.85 0.001 0.01 0.001 0.005 0.001 0.003 0.97 0.95 0.999999 0.99 1.0E-6 0.005 1.0E-6 0.001 1.0E-6 1.0E-6 
0.0 0.0 0.0 0.0 0.95 0.0 0.95 0.0 0.2 0.0 0.0 0.0 0.0 0.0 0.95 0.0 0.95 0.0 0.25 0.01 
0.0 0.0 0.0 0.0 0.998 0.98 0.998 0.99 0.018 0.044 0.0 0.0 0.0 0.0 0.999998 0.99 0.999998 0.998 0.009998 0.029998 
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.75 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.7 0.0 
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.98 0.95 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.99 0.97
 );
}

relation Theft AntiTheft HomeBase CarValue {
values = table(1.0E-6 2.0E-6 3.0E-6 2.0E-6 1.0E-6 5.0E-4 0.002 0.005 0.005 1.0E-6 1.0E-5 1.0E-4 3.0E-4 3.0E-4 1.0E-6 1.0E-5 2.0E-5 5.0E-5 5.0E-5 1.0E-6 
1.0E-6 2.0E-6 3.0E-6 2.0E-6 1.0E-6 0.001 0.005 0.01 0.01 1.0E-6 1.0E-5 2.0E-4 5.0E-4 5.0E-4 1.0E-6 1.0E-5 1.0E-4 2.0E-4 2.0E-4 1.0E-6 
0.999999 0.999998 0.999997 0.999998 0.999999 0.9995 0.998 0.995 0.995 0.999999 0.99999 0.9999 0.9997 0.9997 0.999999 0.99999 0.99998 0.99995 0.99995 0.999999 
0.999999 0.999998 0.999997 0.999998 0.999999 0.999 0.995 0.99 0.99 0.999999 0.99999 0.9998 0.9995 0.9995 0.999999 0.99999 0.9999 0.9998 0.9998 0.999999
 );
}

relation CarValue MakeModel VehicleYear Mileage {
values = table(0.0 0.0 0.0 0.0 0.03 0.16 0.4 0.9 0.1 0.1 0.1 0.1 0.25 0.7 0.99 0.999998 0.0 0.0 0.0 0.0 
0.2 0.5 0.7 0.99 0.0 0.0 0.0 0.0 0.01 0.05 0.1 0.2 0.0 0.0 0.0 0.0 1.0E-6 1.0E-6 1.0E-6 1.0E-6 
0.1 0.1 0.1 0.1 0.3 0.5 0.47 0.06 0.8 0.8 0.8 0.8 0.7 0.2999 0.009999 1.0E-6 0.1 0.1 0.1 0.1 
0.3 0.3 0.2 0.009999 0.0 0.0 0.0 0.0 0.09 0.15 0.3 0.2 0.0 0.0 0.0 0.0 1.0E-6 1.0E-6 1.0E-6 1.0E-6 
0.8 0.8 0.8 0.8 0.6 0.3 0.1 0.02 0.1 0.1 0.1 0.1 0.05 1.0E-4 1.0E-6 1.0E-6 0.9 0.9 0.9 0.9 
0.5 0.2 0.1 1.0E-6 0.0 0.0 0.0 0.0 0.2 0.3 0.3 0.3 0.0 0.0 0.0 0.0 1.0E-6 1.0E-6 1.0E-6 1.0E-6 
0.09 0.09 0.09 0.09 0.06 0.03 0.02 0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 
0.0 0.0 0.0 0.0 1.0 1.0 1.0 1.0 0.7 0.5 0.3 0.3 0.0 0.0 0.0 0.0 1.0E-6 1.0E-6 1.0E-6 1.0E-6 
0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.01 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 1.0 1.0 1.0 0.999996 0.999996 0.999996 0.999996
 );
}

relation HomeBase RiskAversion SocioEcon {
values = table(1.0E-6 0.15 0.35 0.489999 1.0E-6 0.01 0.2 0.95 1.0E-6 0.299999 0.5 0.85 1.0E-6 0.95 0.999997 0.999997 0.8 0.8 0.6 0.5 
0.8 0.25 0.4 1.0E-6 0.8 1.0E-6 1.0E-6 1.0E-6 0.8 1.0E-6 1.0E-6 1.0E-6 0.049999 0.04 0.04 1.0E-6 0.05 0.6 0.3 1.0E-6 
0.05 0.6 0.4 0.001 0.05 0.024445 1.0E-6 1.0E-6 0.15 0.01 0.01 0.01 0.149999 0.14 0.1 0.049998 0.149999 0.1 0.099999 0.148999 
0.149999 0.025554 1.0E-6 1.0E-6 );
}

relation AntiTheft RiskAversion SocioEcon {
values = table(1.0E-6 1.0E-6 0.05 0.5 1.0E-6 1.0E-6 0.2 0.5 0.1 0.3 0.9 0.8 0.95 0.999999 0.999999 0.999999 0.999999 0.999999 0.95 0.5 
0.999999 0.999999 0.8 0.5 0.9 0.7 0.1 0.2 0.05 1.0E-6 1.0E-6 1.0E-6 );
}

relation PropCost OtherCarCost ThisCarCost {
values = table(0.7 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.3 0.95 0.0 0.0 
0.95 0.6 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.05 0.98 0.0 0.05 0.4 0.95 0.0 
0.98 0.8 0.6 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.02 1.0 0.0 0.0 0.05 1.0 0.02 0.2 0.4 1.0 
1.0 1.0 1.0 1.0 );
}

relation OtherCarCost Accident RuggedAuto {
values = table(1.0 1.0 1.0 0.99 0.98 0.95 0.6 0.5 0.4 0.2 0.1 0.005 0.0 0.0 0.0 0.005 0.01 0.03 0.2 0.2 
0.3 0.4 0.5 0.55 0.0 0.0 0.0 0.00499 0.009985 0.01998 0.19998 0.29997 0.29996 0.39996 0.39994 0.4449 0.0 0.0 0.0 1.0E-5 
5.0E-5 2.0E-5 2.0E-5 3.0E-5 4.0E-5 4.0E-5 6.0E-5 1.0E-4 );
}

relation OtherCar SocioEcon {
values = table(0.5 0.8 0.9 0.95 0.5 0.2 0.1 0.05 );
}

relation MedCost Accident Age Cushioning {
values = table(1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0 0.96 0.98 0.99 0.999 0.96 0.98 0.99 0.999 
0.9 0.95 0.97 0.99 0.5 0.8 0.95 0.99 0.5 0.8 0.95 0.99 0.3 0.5 0.9 0.95 0.3 0.5 0.9 0.95 
0.3 0.5 0.9 0.95 0.2 0.3 0.6 0.9 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 
0.03 0.019 0.0099 9.9E-4 0.03 0.019 0.0099 9.9E-4 0.07 0.04 0.025 0.007 0.2 0.15 0.02 0.007 0.2 0.15 0.02 0.007 
0.3 0.2 0.07 0.03 0.3 0.2 0.07 0.03 0.3 0.2 0.07 0.03 0.2 0.3 0.3 0.05 0.0 0.0 0.0 0.0 
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.009 9.0E-4 9.0E-5 9.0E-6 0.009 9.0E-4 9.0E-5 9.0E-6 0.02 0.007 0.003 0.002 
0.2 0.03 0.02 0.002 0.2 0.03 0.02 0.002 0.2 0.2 0.02 0.01 0.2 0.2 0.02 0.01 0.2 0.2 0.02 0.01 
0.3 0.2 0.07 0.03 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.001 1.0E-4 1.0E-5 1.0E-6 
0.001 1.0E-4 1.0E-5 1.0E-6 0.01 0.003 0.002 0.001 0.1 0.02 0.01 0.001 0.1 0.02 0.01 0.001 0.2 0.1 0.01 0.01 
0.2 0.1 0.01 0.01 0.2 0.1 0.01 0.01 0.3 0.2 0.03 0.02 );
}

relation Cushioning RuggedAuto Airbag {
values = table(0.5 0.7 0.0 0.1 0.0 0.0 0.3 0.3 0.1 0.6 0.0 0.0 0.2 0.0 0.6 0.3 0.0 0.7 0.0 0.0 
0.3 0.0 1.0 0.3 );
}

relation Airbag MakeModel VehicleYear {
values = table(1.0 0.1 1.0 0.05 1.0 0.2 1.0 0.6 1.0 0.1 0.0 0.9 0.0 0.95 0.0 0.8 0.0 0.4 0.0 0.9
 );
}

relation ILiCost Accident {
values = table(1.0 0.999 0.9 0.8 0.0 9.98E-4 0.05 0.1 0.0 1.0E-6 0.03 0.06 0.0 1.0E-6 0.02 0.04 );
}

relation DrivHist DrivingSkill RiskAversion {
values = table(0.001 0.002 0.03 0.3 0.1 0.5 0.9 0.95 0.3 0.6 0.99 0.999998 0.004 0.008 0.15 0.3 0.3 0.3 0.07 0.04 
0.3 0.3 0.009999 1.0E-6 0.995 0.99 0.82 0.4 0.6 0.2 0.03 0.01 0.4 0.1 1.0E-6 1.0E-6 );
}

}

