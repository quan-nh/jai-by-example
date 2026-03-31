#import "Basic";

// Here’s a function that will take an arbitrary number of ints as arguments.
sum :: (nums: ..int) {
    print("% ", nums);
    total := 0;
    
    // Within the function, the type of nums is equivalent to []int.
    for num: nums {
        total += num;
    }
    print("%\n", total);
}

main :: () {
    // Variadic functions can be called in the usual way with individual arguments.
    sum(1, 2);
    sum(1, 2, 3);
    
    // If you already have multiple args in an array,
    // apply them to a variadic function using func(..arr) like this.
    nums := int.[1, 2, 3, 4];
    sum(..nums);
}

/*
[1, 2] 3
[1, 2, 3] 6
[1, 2, 3, 4] 10
*/