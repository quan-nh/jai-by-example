#import "Basic";

plus :: (a: int, b: int) -> int {
    return a + b;
}

main :: () {
    res := plus(1, 2);
    print("1+2 =%\n", res);
}

/*
1+2 =3
*/