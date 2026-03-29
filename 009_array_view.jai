#import "Basic";

main :: () {
    a: [8] float;
    for i: 0..7 a[i] = cast(float) i;  // Fill a with some data.

    // We want to be able to do lots of stuff with arrays,
    // like passing them to procedures. This is a strongly-typed language,
    // so we need to have a type that tells us we are dealing with an array,
    // but doesn't care so much about size (not at compile time, at least).

    // Thus, we have the array view, which you can declare like this:
    c: [] float;

    // an array view is equivalent to the following data structure:
    // Array_View :: struct {
    //     count: s64;
    //     data:  *WhateverType;
    // }

    c = a;    // c is now a view on a;

    print("c[5] is: %\n", c[5]);

    c.count = 5;
    for value, index: c {  // Our iteration will only go from 0..4, since we set the count to 5.
        print("c[%] == %\n", index, value);
    }

    // We could also change the data pointer of c.
    c.data += 1;  // Increment the data pointer by 1 slot (4 bytes in this case).

    print("\n");
    print("After pointer bump:\n");
    for value, index: c  print("c[%] == %\n", index, value);
}

/*
c[5] is: 5
c[0] == 0
c[1] == 1
c[2] == 2
c[3] == 3
c[4] == 4

After pointer bump:
c[0] == 1
c[1] == 2
c[2] == 3
c[3] == 4
c[4] == 5
*/
