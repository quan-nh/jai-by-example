#import "Basic";

// The $ before the T indicates that this is a compile-time type variable,
// that changes when 'square' is called.
square :: (x: $T) -> T {
    return x*x;
}

main :: () {
    a := 5;
    b := square(a);
    print("square(a) is %, of type %\n", b, type_of(b));
    
    e := 69.125;
    f := square(e);
    print("input is % (type %); output is % (type %).\n", e, type_of(e), f, type_of(f)); // Input and output are of type float32.
}
/*
square(a) is 25, of type s64
input is 69.125 (type float32); output is 4778.265625 (type float32).
*/