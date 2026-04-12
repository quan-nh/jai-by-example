#import "Basic";

Base :: struct {
    num: int;
}

describe :: (b: Base) -> string {
    return tprint("base with num=%", b.num);
}

// A container embeds a base with `using`
Container :: struct {
    using base: Base;
    str: string;
}

// #as indicates that a struct can implicitly cast to one of its members
Container2 :: struct {
    #as base: Base;
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
    
    print("\n");
    
    co2 := Container2.{
        base = Base.{
            num = 2
        },
        str = "other name"
    };
    print("co2: %\n", co2);
    print("describer: %\n", describe(co2));
}
/*
co={num: 1, str: some name}
also num: 1

co2: {{2}, "other name"}
describer: base with num=2
*/