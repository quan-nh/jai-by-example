#import "Basic";

main :: () {
    resizable: [..] int;   // Declare a resizable array.

    // Call array_add to add some elements to the array:
    array_add(*resizable, 1);
    array_add(*resizable, 4);
    array_add(*resizable, 9);
    array_add(*resizable, 16);

    print("resizable.count == %\n", resizable.count);
    print("Elements of 'resizable' are:");
    for resizable print(" %", it);
    print("\n");

    // Resizable arrays automatically cast to array views, so you can easily pass them
    // to functions that want array views, for example:

    f :: (array: [] int) {
        for array print("array[%] is %.\n", it_index, it);
    }
    print("\n");
    print("Resizable:\n");
    f(resizable);  // Call f with the resizable array.

    // A resizable array is equivalent to the following data structure:

    // Resizable_Array :: struct {
    //     count      : s64;
    //     data       : *WhateverType;
    //     allocated  : s64;
    //
    //     allocator      : Allocator;
    // }
    //
    // 'allocated' tells us how much memory is actually pointed to by 'data'.
    // As long as count < allocated, there is enough room to add more elements
    // without paying the runtime cost of resizing the memory.

    print("\n");
    print("resizable.count == %; resizable.allocated == %.\n", resizable.count, resizable.allocated);
}

/*
resizable.count == 4
Elements of 'resizable' are: 1 4 9 16

Resizable:
array[0] is 1.
array[1] is 4.
array[2] is 9.
array[3] is 16.

resizable.count == 4; resizable.allocated == 8.
*/
