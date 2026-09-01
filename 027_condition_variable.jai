#import "Basic";
#import "Thread";

// A condition variable allows one thread to sleep until another thread changes some shared state.

Condition_Data :: struct {
    mutex:     Mutex;
    ready:     Condition_Variable;
    value:     int;
    has_value: bool;
}

condition_worker :: (thread: *Thread) -> s64 {
    data := cast(*Condition_Data) thread.data;

    lock(*data.mutex);

    data.value = 123;
    data.has_value = true;

    wake(*data.ready); // `wake(*condition)` to wake one waiter.
                       // `wake_all(*condition)` to wake all waiters.
    unlock(*data.mutex);

    return 0;
}

main :: () {
    data: Condition_Data;

    init(*data.mutex);
    init(*data.ready);

    thread: Thread;

    assert(thread_init(*thread, condition_worker));
    thread.data = *data;
    thread_start(*thread);

    lock(*data.mutex);

    // Always check the condition in a loop.
    while !data.has_value {
        // wait releases the mutex while sleeping and reacquires it
        // before returning.
        wait(*data.ready, *data.mutex);
    }

    value := data.value;

    unlock(*data.mutex);

    thread_is_done(*thread, -1);
    thread_deinit(*thread);

    destroy(*data.ready);
    destroy(*data.mutex);

    print("Condition-variable value: %\n", value); // Condition-variable value: 123
}
