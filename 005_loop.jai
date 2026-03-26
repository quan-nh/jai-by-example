#import "Basic";

main :: () {
    // while loop
    x := 1;
    while x <= 3 {
        print("%\n", x);
        x += 1;
    }
    
    print("\n");
    
    // break
    x = 0;
    while x < 10 {
        print("%\n", x);
        if x * x == 25 break;
        x += 1;
    }
    
    print("\n");
    
    // continue
    x = 0;
    while x < 10 {
        defer x += 1;
        if x % 2 == 0 continue;
        print("%\n", x);
    }
    
    print("\n");
    
    // for loop
    for 0..2 {
        print("%\n", it);
    }
}

/*
1
2
3

0
1
2
3
4
5

1
3
5
7
9

0
1
2
*/