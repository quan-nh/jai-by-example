#import "Basic";
#import "Thread";
#import "Atomics";

// `Thread_Group` maintains fixed workers and distributes submitted work among them.

Job :: struct {
    input:  int;
    output: int;
}

job_worker :: (
    group:  *Thread_Group,
    thread: *Thread,
    work:   *void
) -> Thread_Continue_Status {
    job := cast(*Job) work;

    job.output = job.input * job.input;

    return .CONTINUE;
}

main :: () {
    group: Thread_Group;

    init(*group, 2, job_worker);

    // Disable diagnostic logging from Thread_Group.
    group.logging = false;

    start(*group);

    jobs: [4] Job;

    for *jobs {
        it.input = it_index + 1;

        // The Job must remain alive until it is returned as completed.
        add_work(*group, it);
    }

    remaining := jobs.count;

    while remaining > 0 {
        completed := get_completed_work(*group);
        remaining -= completed.count;

        for completed {
            job := cast(*Job) it;
            print("Completed: % squared is %\n", job.input, job.output);
        }

        if completed.count == 0 {
            sleep_milliseconds(1);
        }

        // get_completed_work uses temporary storage. Do this only
        // after finished reading the returned array.
        reset_temporary_storage();
    }

    assert(shutdown(*group));

    print(
        "Results: %, %, %, %\n",
        jobs[0].output,
        jobs[1].output,
        jobs[2].output,
        jobs[3].output
    );
}
/*
Completed: 1 squared is 1
Completed: 3 squared is 9
Completed: 2 squared is 4
Completed: 4 squared is 16
Results: 1, 4, 9, 16
*/
