#import "Basic";

vals :: () -> int, int {
    return 3,7;
}

main :: () {
    a, b := vals();
    print("a = % b = %\n", a, b);
    
    _, c := vals();
    print("c = %\n", c);
}
/*
a = 3 b = 7
c = 7
*/