#import "Basic";

main :: () {
    // Strings
    s: string;
    s = "hello";
    print("s is: %\n", s);
    print("type_of(s) is: %\n", type_of(s));
    
    print("\n");
    
    // Unsigned integers
    a: u8  = 10;
    b: u16 = 50;
    c: u32 = 0x78f;  // You can write numbers in hexadecimal by starting with 0x.
    d: u64 = 0xfade_deaf_cafe_babe;
    
    // Signed integers
    e: s8  = -7;
    f: s16 = 0b101101101;    // You can write numbers in binary by starting with 0b.
    g: s32 = -5_069_105;
    h: s64 = 987654321;
    
    // Any integer numeric constant is s64 by default
    k := 7;
    print("k is %; type_of(k) is %.\n", k, type_of(k));
    
    // 'int', which is just an alias for s64
    my_int: int = 7;
    
    // Floats
    l: float32 = 123.005;
    m: float64 = 500.321;
    
    // Any floating-point numeric constant is float32 by default.
    // If it needs more, it's float64.
    n := 1.111;
    o := 1.11111111111111111;

    print("n is %, of type %.\n", n, type_of(n));
    print("o is %, of type %.\n", o, type_of(o));
    
    // The type 'float' is an alias for float32.
    x: float32 = 111.0;
    y: float   = x;

    print("float_matching: %\n", type_of(x) == type_of(y));
    
    print("\n");
    
    // Booleans, with boolean operators as you’d expect
    print("true && false: %\n", true && false);
    print("true || false: %\n", true || false);
    print("!true: %\n", !true);
}

/*
s is: hello
type_of(s) is: string

k is 7; type_of(k) is s64.
n is 1.111, of type float32.
o is 1.111111, of type float64.
float_matching: true

true && false: false
true || false: true
!true: false
*/