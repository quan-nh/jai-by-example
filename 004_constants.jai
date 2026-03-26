#import "Basic";
Math :: #import "Math";

// declare a constant value with two colons
s :string: "constant";

main :: () {
    print("s = %\n", s);
    
    n :: 2;
    d :: 10 / n;
    print("type_of d: %, value = %\n", type_of(d), d);
    
    // Math.Sin expects a float64 -> cast(float64)
    print("sin(d) = %\n", Math.sin(d));
}

/*
s = constant
type_of d: s64, value = 5
sin(d) = -0.958924
*/