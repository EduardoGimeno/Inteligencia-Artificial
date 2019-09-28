//	   Network
//	   Elvira format

bnet "Alarm_John_Mary.elv" {

//		 Network Properties

kindofgraph = "directed";
comment = "";
default node states = ("yes" , "no");

// Variables

node B(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =146;
pos_y =81;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("si" "no");
}

node E(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =421;
pos_y =82;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("si" "no");
}

node A(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =268;
pos_y =217;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("si" "no");
}

node J(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =148;
pos_y =363;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("si" "no");
}

node M(finite-states) {
comment = "";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =431;
pos_y =362;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("si" "no");
}

//		 Links of the associated graph:

link B A;

link E A;

link A J;

link A M;

//		Network Relationships:

relation B {
kind-of-relation = potential;
deterministic=false;
values = table(0.001 0.999 );
}

relation E {
kind-of-relation = potential;
deterministic=false;
values = table(0.002 0.998 );
}

relation A B E {
kind-of-relation = potential;
deterministic=false;
values = table(0.95 0.94 0.29 0.001 0.05 0.06 0.71 0.999 );
}

relation J A {
kind-of-relation = potential;
deterministic=false;
values = table(0.9 0.05 0.1 0.95 );
}

relation M A {
kind-of-relation = potential;
deterministic=false;
values = table(0.7 0.01 0.3 0.99 );
}

}

