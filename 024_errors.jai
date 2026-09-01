#import "Basic";

// Simple failure: return `success: bool`

// `#must` tells the compiler that the caller must not silently discard that return value.
f :: (arg: int) -> (result: int, success: bool #must) {
    if arg == 42 {
        return -1, false;
    }

    return arg + 3, true;
}

// Detailed errors: return an enum or struct
Error_Code :: enum {
    NONE;
    OUT_OF_TEA;
    POWER_FAILURE;
}
 
Error :: struct {
    code: Error_Code;
    message: string;
}
 
make_tea :: (arg: int) -> (error: Error #must) {
    if arg == 2 return .{code = .OUT_OF_TEA, message = "no more tea available"};
    if arg == 4 return .{code = .POWER_FAILURE, message = "can't boil water"};
    return .{code = .NONE};
}
 
main :: () {
    result, success := f(42);
    if !success {
        print("f failed\n");
    } else {
        print("f worked: %\n", result);
    }
 
    tea_error := make_tea(2);
    // `#complete` asks the compiler to verify that every enum member is handled.
    // Adding a new `Error_Code` later will produce a compile-time error until this code handles it.
    if #complete tea_error.code == {
        case .NONE;
            print("Tea is ready!\n");
    
        case .OUT_OF_TEA;
            print("We should buy new tea!\n");
    
        case .POWER_FAILURE;
            print("Power failure: %\n", tea_error.message);
    }
 }
 