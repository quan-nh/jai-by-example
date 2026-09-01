#import "Basic";
#import "Thread";
#import "Atomics";

// Atomics avoid a mutex for simple shared scalar operations.

Atomic_Data :: struct {
    counter: s64;
}

atomic_worker :: (thread: *Thread) -> s64 {
    data := cast(*Atomic_Data) thread.data;

    for 1..10000 {
        atomic_increment(*data.counter);

        // Other common operations include:
        
        // old_value := atomic_add(*counter, 10);
        // old_value := atomic_swap(*counter, 0);
        
        // success := compare_and_swap(
        //     *counter,
        //     expected_value,
        //     new_value
        // );
    }

    return 0;
}

main :: () {
    data: Atomic_Data;

    a, b: Thread;

    assert(thread_init(*a, atomic_worker));
    assert(thread_init(*b, atomic_worker));

    a.data = *data;
    b.data = *data;

    thread_start(*a);
    thread_start(*b);

    thread_is_done(*a, -1);
    thread_is_done(*b, -1);

    thread_deinit(*a);
    thread_deinit(*b);

    print("Atomic counter: %\n", data.counter); // Atomic counter: 20000
}
