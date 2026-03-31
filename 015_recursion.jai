#import "Basic";

fact :: (n: int) -> int {
    if n == 0 {
        return 1;
    }
    return n * fact(n - 1);
}

main :: () {
    print("%\n",fact(7));
}

/*
5040
*/