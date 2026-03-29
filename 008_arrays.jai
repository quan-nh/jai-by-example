#import "Basic";

main :: () {
  // create an array a that will hold exactly 5 ints.
  // By default an array is zero-valued, which for ints means 0s.
  a: [5] int;
  print("emp: %\n", a);

  // get/set
  a[4] = 100;
  print("set: %\n", a);
  print("get: %\n", a[4]);

  print("len: %\n", a.count);

  // Use this syntax to declare and initialize an array in one line.
  b := int.[1, 2, 3, 4, 5];
  print("dcl: %\n", b);
}

/*
emp: [0, 0, 0, 0, 0]
set: [0, 0, 0, 0, 100]
get: 100
len: 5
dcl: [1, 2, 3, 4, 5]
*/
