#import "Basic";

main :: () {
    // the format to declare a variable is:
    // name : type = value;
    a : string = "initial";
    print("a = %\n", a);
    
    // declare multiple variables at once
    b, c : int = 1,2;
    print("b = %, c = %\n", b, c);
    
    // infer the type of initialized variables
    d := true;
    print("d is of type %, value %\n", type_of(d), d);
    
    // Variables declared without a corresponding initialization are zero-valued
    e : int;
    print("e = %\n", e);
}

/*
a = initial
b = 1, c = 2
d is of type bool, value true
e = 0
*/