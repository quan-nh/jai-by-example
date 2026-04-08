#import "Basic";
#import "Unicode";

main :: () {
    // A string is essentially an array view, where the data is an array of u8.
    // When your program contains a string like "Hello", the compiler puts the
    // bytes  H, e, l, l, o  somewhere in memory, then gives you this array view
    // with  count == 5  and a data pointer pointing at the initial H.

    s := "สวัสดี";
    print("Len: %\n", s.count);
    
    for s print("% ", it);
    print("\n");
    
    // to iterate over a string one UTF-8 character at a time
    for :utf8_iter s print("index [%] has utf8 value %.\n", it_index, it);
}
/*
Len: 18
224 184 170 224 184 167 224 184 177 224 184 170 224 184 148 224 184 181
index [0] has utf8 value 3626.
index [1] has utf8 value 3623.
index [2] has utf8 value 3633.
index [3] has utf8 value 3626.
index [4] has utf8 value 3604.
index [5] has utf8 value 3637.
*/