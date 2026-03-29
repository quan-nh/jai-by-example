#import "Basic";

Fruit :: enum u32 {
    BANANA;
    APPLE;
    APRICOT;
    WATERMELON;
}

main :: () {
    // basic switch
    i := 2;
    print("Write % as ", i);
    if i == {
        case 1; print("one\n");
        case 2; print("two\n");
        case 3; print("three\n");
    }

    // each 'case' stops at the next one and doesn't continue through
    // If you want to fall through into the next 'case', you can put #through as the last statement
    // A common way to use #through is when you want to do the same thing for several input values:
    flavor := Fruit.APPLE;
    if flavor == {
        case .BANANA;     #through;
        case .APPLE;      #through;

        case .WATERMELON; print("The fruit '%' is good.\n", flavor);

        case .APRICOT;    #through;

        case;             print("This fruit '%' is bad.\n", flavor);
    }

    // if we want to make sure if_case cover all values, we can use #completed
    // if #complete flavor == {..}

    // Each expression must be a constant known at compile-time, which means you
    // can't use runtime variables or call functions. Also, each 'case' can only
    // specify a single value, rather than a range like you might do with:
    //    if (x >= low) && (x <= high) ...;

    // So any type that is representable as a constant, and comparable via built-in operator ==, will work:
    word := "Hello";

    if word == {
        case "Hello";
        case "Sailor";
        case "Pile";
    }

    a: Type = int;
    if a == {
        case float;  print("float\n");
        case string; print("string\n");
        case int;    print("int\n");
        case;        print("unknown\n");
    }
}

/*
Write 2 as two
The fruit 'APPLE' is good.
int
*/
