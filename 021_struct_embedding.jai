#import "Basic";

Base :: struct {
    num: int;
}

// A container embeds a base with `using`
Container :: struct {
    using base: Base;
    str: string;
}

main :: () {
    co := Container.{
        base = Base.{
            num = 1
        },
        str = "some name"
    };
    
    // We can access the base’s fields directly on co, e.g. co.num.
    print("co={num: %, str: %}\n", co.num, co.str);
    
    // Alternatively, we can spell out the full path using the embedded type name.
    print("also num: %\n", co.base.num);
}
/*
co={num: 1, str: some name}
also num: 1
*/