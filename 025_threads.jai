#import "Basic";
#import "Thread";

Raw_Data :: struct {
    input:  int;
    output: int;
}

raw_worker :: (thread: *Thread) -> s64 {
    data := cast(*Raw_Data) thread.data;

    data.output = data.input * 2;

    return 0;
}

main :: () {
    data := Raw_Data.{input = 21};
    thread: Thread;

    success := thread_init(*thread, raw_worker);
    if !success {
        print("Could not create thread.\n");
        return;
    }

    // Must be assigned before starting the thread.
    thread.data = *data;

    thread_start(*thread);

    // -1 means wait indefinitely.
    thread_is_done(*thread, -1);

    // Joins and releases the thread's resources.
    thread_deinit(*thread);

    print("Raw thread result: %\n", data.output); // Raw thread result: 42
}