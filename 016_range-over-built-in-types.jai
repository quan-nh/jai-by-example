#import "Basic";

main :: () {
    nums := int.[2, 3, 4];
    sum := 0;
    for num: nums {
        sum += num;
    }
    print("sum: %\n", sum);
    
    // with index
    for num, i: nums {
        if num == 3 {
            print("index: %\n", i);
        }
    }
    
    // range on map
    
    // range on strings
    x := "Hello";
    // You can iterate over strings with 'for', just
    // like array, as strings really are array views of u8.
    for x print("x: index [%] has byte value %.\n", it_index, it);
    
    // to iterate over a string one UTF-8 character
    #import "Unicode";
    LYRICS :: "しかし、魚の質を考えれば、リスクを負う価値はあります。得られる風味はリスクを上回ります。";
    for :utf8_iter LYRICS   print("LYRICS: index [%] has utf8 value %.\n", it_index, it);
}
/*
sum: 9
index: 1
x: index [0] has byte value 72.
x: index [1] has byte value 101.
x: index [2] has byte value 108.
x: index [3] has byte value 108.
x: index [4] has byte value 111.
LYRICS: index [0] has utf8 value 12375.
LYRICS: index [1] has utf8 value 12363.
LYRICS: index [2] has utf8 value 12375.
LYRICS: index [3] has utf8 value 12289.
LYRICS: index [4] has utf8 value 39770.
LYRICS: index [5] has utf8 value 12398.
LYRICS: index [6] has utf8 value 36074.
LYRICS: index [7] has utf8 value 12434.
LYRICS: index [8] has utf8 value 32771.
LYRICS: index [9] has utf8 value 12360.
LYRICS: index [10] has utf8 value 12428.
LYRICS: index [11] has utf8 value 12400.
LYRICS: index [12] has utf8 value 12289.
LYRICS: index [13] has utf8 value 12522.
LYRICS: index [14] has utf8 value 12473.
LYRICS: index [15] has utf8 value 12463.
LYRICS: index [16] has utf8 value 12434.
LYRICS: index [17] has utf8 value 36000.
LYRICS: index [18] has utf8 value 12358.
LYRICS: index [19] has utf8 value 20385.
LYRICS: index [20] has utf8 value 20516.
LYRICS: index [21] has utf8 value 12399.
LYRICS: index [22] has utf8 value 12354.
LYRICS: index [23] has utf8 value 12426.
LYRICS: index [24] has utf8 value 12414.
LYRICS: index [25] has utf8 value 12377.
LYRICS: index [26] has utf8 value 12290.
LYRICS: index [27] has utf8 value 24471.
LYRICS: index [28] has utf8 value 12425.
LYRICS: index [29] has utf8 value 12428.
LYRICS: index [30] has utf8 value 12427.
LYRICS: index [31] has utf8 value 39080.
LYRICS: index [32] has utf8 value 21619.
LYRICS: index [33] has utf8 value 12399.
LYRICS: index [34] has utf8 value 12522.
LYRICS: index [35] has utf8 value 12473.
LYRICS: index [36] has utf8 value 12463.
LYRICS: index [37] has utf8 value 12434.
LYRICS: index [38] has utf8 value 19978.
LYRICS: index [39] has utf8 value 22238.
LYRICS: index [40] has utf8 value 12426.
LYRICS: index [41] has utf8 value 12414.
LYRICS: index [42] has utf8 value 12377.
LYRICS: index [43] has utf8 value 12290.
*/