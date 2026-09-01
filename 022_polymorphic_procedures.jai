#import "Basic";

// The $ before the T indicates that this is a compile-time type variable,
// that changes when 'square' is called.
square :: (x: $T) -> T {
    return x*x;
}


// And, polymorphic functions will work correctly as long as the code inside them compiles for the input types.
// So, if we define an operator * for a struct, we can call square on that struct:
Vector3 :: struct { x, y, z: float; }

// The `*` operator must be visible from the scope where `square` is declared. 
operator * :: (a: Vector3, b: Vector3) -> Vector3 {
    r: Vector3 = ---;
    r.x = a.x * b.x;
    r.y = a.y * b.y;
    r.z = a.z * b.z;

    return r;
}

main :: () {
    a := 5;
    b := square(a);
    print("square(a) is %, of type %\n", b, type_of(b));
    //     square(a) is 25, of type s64
    
    e := 69.125;
    f := square(e);
    print("input is % (type %); output is % (type %).\n", e, type_of(e), f, type_of(f)); // Input and output are of type float32.
    //     input is 69.125 (type float32); output is 4778.265625 (type float32).
    
    v := Vector3.{-1, 2, -3};
    w := square(v);

    print("w is %, of type %.\n", w, type_of(w));
    //     w is {1, 4, 9}, of type Vector3.
}
