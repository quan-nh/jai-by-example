#import "Basic";
#import "Sort";

// Sorting structs by a field

Person :: struct {
    name: string;
    age:  int;
}

main :: () {
    people := Person.[
        .{name = "Charlie", age = 35},
        .{name = "Alice",   age = 20},
        .{name = "Bob",     age = 27},
    ];

    quick_sort(people, person => person.age);

    for people {
        print("%: %\n", it.name, it.age);
    }
}
/*
Alice: 20
Bob: 27
Charlie: 35
*/
