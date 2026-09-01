#import "Basic";
#import "Math";

// Just like procedures, struct declarations can have argument lists.
// These arguments can be used inside the body of the struct to determine
// types and values of the struct's members.

Holder :: struct ($T: Type, $N: s64) {
    array: [N] T;
}


main :: () {
    floats:  Holder(float, 5);
    vectors: Holder(Vector3, 3);

    print("floats:  %\n", floats);  // floats:  {[0, 0, 0, 0, 0]}
    print("vectors: %\n", vectors); // vectors: {[{0, 0, 0}, {0, 0, 0}, {0, 0, 0}]}

    // Holder(float, 5) is converted into a struct that would be exactly the same
    // as the following:

    Other_Holder :: struct {
        array: [5] float;
    }
}
