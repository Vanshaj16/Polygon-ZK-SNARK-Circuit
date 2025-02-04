pragma circom 2.0.0;

template Multiplier2 () {  
 // signal inputs
    signal input A;
    signal input B;

    // signals from gates
    signal X;
    signal Y;
     
    // final siganl output
    signal output Q;

    // component gates used to create project circuit
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();

    // circuit logic
    andGate.a <== A;
    andGate.b <== B;
    X <== andGate.out;

    notGate.in <== B;
    Y <== notGate.out;

    orGate.a <== X;
    orGate.b <== Y;
    Q <== orGate.out;
}
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

component main = Multiplier2();