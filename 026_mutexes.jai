#import "Basic";
#import "Thread";

Mutex_Data :: struct {
    mutex:   Mutex;
    counter: int;
}

mutex_worker :: (thread: *Thread) -> s64 {
    data := cast(*Mutex_Data) thread.data;

    for 1..10000 {
        lock(*data.mutex);
        data.counter += 1;
        unlock(*data.mutex);
    }

    return 0;
}

main :: () {
    data: Mutex_Data;
    init(*data.mutex);

    a, b: Thread;

    assert(thread_init(*a, mutex_worker));
    assert(thread_init(*b, mutex_worker));

    a.data = *data;
    b.data = *data;

    thread_start(*a);
    thread_start(*b);

    thread_is_done(*a, -1);
    thread_is_done(*b, -1);

    thread_deinit(*a);
    thread_deinit(*b);

    destroy(*data.mutex);

    print("Mutex counter: %\n", data.counter); // Mutex counter: 20000
}
