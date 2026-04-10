#import "Basic";

Person :: struct {
    name: string;
    age: int;
}

new_person :: (name: string) -> *Person {
    p := Person.{name= name};
    p.age = 42;
    return *p;
}

main :: () {
    print("%\n", Person.{"Bob", 20});
    print("%\n", Person.{name= "Alice", age= 30});
    
    // Omitted fields will be zero-valued
    print("%\n", Person.{name= "Fred"});
    
    // constructor functions
    print("%\n", new_person("Jon"));
    
    // Access struct fields with a dot
    s := Person.{name= "Sean", age= 50};
    print("%\n", s.name);
    
    // You can also use dots with struct pointers - the pointers are automatically dereferenced.
    sp := *s;
    print("%\n", sp.age);
    
    // Structs are mutable.
    sp.age = 51;
    print("%\n", sp.age);
    
    // If a struct type is only used for a single value, we don’t have to give it a name.
    // The value can have an anonymous struct type.
    dog := struct {
        name:   string;
        isGood: bool;
    }.{
        "Rex",
        true
    };
    print("%\n", dog);
}
/*
{"Bob", 20}
{"Alice", 30}
{"Fred", 0}
1_6bb8_ab40
Sean
50
51
{"Rex", true}
*/