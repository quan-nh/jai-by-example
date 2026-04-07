#import "Basic";

zeroval :: (ival: int) {
    ival = 0;
}

// In this language, * before a type T means: pointer type
//                   * before a value V means: address of the value (pointer, same as & in C/C++)

zeroptr :: (iptr: *int) {
    iptr.* = 0; // dereference a pointer
}

main :: () {
    i := 1;
    print("initial: %\n", i);
    zeroval(i);
    print("zeroval: %\n", i);

    // The *i syntax gives the memory address of i, i.e. a pointer to i.
    zeroptr(*i);
    print("zeroptr: %\n", i);

    // pointers can be printed too.
    print("pointer: %\n", *i);
}
/*
initial: 1
zeroval: 1
zeroptr: 0
*/