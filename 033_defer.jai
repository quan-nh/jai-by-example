#import "Basic";

// Jai’s `defer` schedules a statement to run when the **current lexical scope is exited**.

main :: () {
    print("start\n");
    defer print("cleanup\n");

    print("working\n");
}
/*
start
working
cleanup
*/

// A common use is releasing memory:
print_message :: () {
    message := sprint("Hello, %!", "Jai");
    defer free(message);

    print("%\n", message);

    // message is freed when this procedure's scope exits.
}

// It also executes on an early `return`:
do_work :: (success: bool) -> bool {
    resource := acquire_resource();
    defer release_resource(resource);

    if !success {
        return false; // release_resource runs first
    }

    return true; // release_resource also runs first
}

// Defers execute last-in, first-out:
defer_order :: () {
    defer print("first defer\n");
    defer print("second defer\n");

    print("body\n");
}
/*
body
second defer
first defer
*/

// This is useful when resources must be cleaned up in reverse acquisition order:
first := acquire_first();
defer release_first(first);

second := acquire_second();
defer release_second(second);

// Cleanup order:
// 1. release_second
// 2. release_first

// Unlike Go, where `defer` runs when the surrounding **function** returns, Jai’s `defer` runs when its enclosing **scope** is exited:
defer_scope :: () {
    print("outer start\n");

    {
        defer print("leaving inner scope\n");
        print("inside\n");
    }

    print("outer end\n");
}
/*
outer start
inside
leaving inner scope
outer end
*/

// For multiple cleanup statements, use a block:
defer_block :: {
    old_value := context.some_value;
    context.some_value = new_value;
    
    defer {
        print("Restoring old value\n");
        context.some_value = old_value;
    }
}

// A loop body is also a scope. The deferred statement runs at the end of each iteration, including when leaving through `continue` or `break`:
defer_loop :: {
    i := 0;
    
    while i < 5 {
        defer i += 1;  // Be aware that the defer still runs when `break` executes.
    
        if i == 2 continue;
        if i == 4 break;
    
        print("%\n", i);
    }
}