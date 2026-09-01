#import "Basic";
#import "Thread";

// A semaphore is useful for signaling that some number of resources or completed operations are available.

Semaphore_Data :: struct {
    done:  Semaphore;
    value: int;
}

semaphore_worker :: (thread: *Thread) -> s64 {
    data := cast(*Semaphore_Data) thread.data;

    data.value = 456;

    // Increment the semaphore and wake a waiter.
    signal(*data.done);

    return 0;
}

main :: () {
    data: Semaphore_Data;

    // Defaults to an initial value of zero.
    init(*data.done);

    thread: Thread;

    assert(thread_init(*thread, semaphore_worker));
    thread.data = *data;
    thread_start(*thread);

    // Defaults to waiting indefinitely.
    result := wait_for(*data.done);

    if result != .SUCCESS {
        print("Semaphore wait failed: %\n", result);
    } else {
        print("Semaphore value: %\n", data.value); // Semaphore value: 456
    }

    thread_is_done(*thread, -1);
    thread_deinit(*thread);

    destroy(*data.done);
}
