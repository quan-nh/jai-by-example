#import "Basic";

main :: () {
    // basic example
    if 7%2 == 0 {
        print("7 is even\n");
    } else {
        print("7 is odd\n");
    }
    
    // if statement without else
    if 8%4 == 0 {
        print("8 is divisible by 4\n");
    }
    
    if 8%2 == 0 || 7%2 == 0 {
        print("either 8 or 7 are even\n");
    }
    
    // truthiness
    // Every basic data type has a default value that is equivalent to 0;
    // this value becomes 'false' if you cast it to bool,
    // and it is evaluated as false in the condition slot of an 'if' statement.
    x: int; // default value is 0
    if x then print("x is true!\n");
         else print("x is false!\n");
         
    // ifx: expression if
    x = 7;
    y := ifx x then x else 1;
    print("y is %\n", y);
}

/*
7 is odd
8 is divisible by 4
either 8 or 7 are even
x is false!
y is 7
*/