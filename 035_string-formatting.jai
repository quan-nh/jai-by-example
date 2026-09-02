#import "Basic";

Point :: struct {
    x: int;
    y: int;
}

main :: () {
    p := Point.{1, 2};

    // Default and detailed struct formatting.
    print("struct1: %\n", p);
    // struct1: {1, 2}

    print("struct2: %\n", FormatStruct.{
        value = p,
        use_long_form_if_more_than_this_many_members = -1,
    });
    // struct2: {x = 1; y = 2; }

    print("struct3: %\n", FormatStruct.{
        value = p,
        draw_type_name = true,
        use_long_form_if_more_than_this_many_members = -1,
    });
    // struct3: Point{x = 1; y = 2; }

    // General values.
    print("type: %\n", type_of(p)); // type: Point
    print("bool: %\n", true);       // bool: true
    print("int: %\n", 123);         // int: 123

    // Integer bases.
    print("bin: %\n", FormatInt.{
        value = 14,
        base  = 2,
    });
    // bin: 1110

    print("char: %\n", "!"); // char: !

    print("hex: %\n", FormatInt.{
        value = 456,
        base  = 16,
    });
    // hex: 1c8

    // Float formatting.
    decimal: float64 = 78.9;
    scientific: float64 = 123400000.0;

    print("float1: %\n", FormatFloat.{
        value          = decimal,
        trailing_width = 6,
        zero_removal   = .NO,
    });
    // float1: 78.900000

    print("float2: %\n", FormatFloat.{
        value          = scientific,
        trailing_width = 6,
        zero_removal   = .NO,
        mode           = .SCIENTIFIC,
    });
    // float2: 1.234000e+08

    // Strings and pointers.
    print("str: %\n", "a string"); // str: a string
    print("pointer: %\n", *p);     // pointer: 1_6d56_67f8

    // Integer width and padding.
    print("width1: |%|%|\n",
        FormatInt.{
            value          = 12,
            minimum_digits = 6,
            padding        = #char " ",
        },
        FormatInt.{
            value          = 345,
            minimum_digits = 6,
            padding        = #char " ",
        });
    // width1: |    12|   345|

    // Float width and precision.
    print("width2: |%|%|\n",
        FormatFloat.{
            value          = 1.2,
            width          = 6,
            trailing_width = 2,
            zero_removal   = .NO,
        },
        FormatFloat.{
            value          = 3.45,
            width          = 6,
            trailing_width = 2,
            zero_removal   = .NO,
        });
    // width2: |  1.20|  3.45|

    // Like Go's fmt.Sprintf. sprint allocates persistent memory.
    formatted := sprint("sprintf: a %", "string");
    defer free(formatted);

    print("%\n", formatted); // sprintf: a string

    // Print to standard error.
    print(
        "io: an %\n",
        "error",
        to_standard_error = true,
    );
    // io: an error
}
