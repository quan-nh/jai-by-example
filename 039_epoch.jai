#import "Basic";

main :: () {
    // Current wall-clock time.
    now := current_time_consensus();
    now_calendar := to_calendar(now, .UTC);

    print("now: %\n", calendar_to_iso_string(now_calendar));

    // Apollo_Time starts at the Apollo 11 moon landing rather than
    // the Unix epoch, so subtract Jai's Unix epoch constant.
    since_unix_epoch := now - APOLLO_TIME_FOR_JAN_1_1970;

    unix_seconds, seconds_ok :=
        to_seconds(since_unix_epoch);

    unix_milliseconds, milliseconds_ok :=
        to_milliseconds(since_unix_epoch);

    unix_nanoseconds, nanoseconds_ok :=
        to_nanoseconds(since_unix_epoch);

    assert(seconds_ok);
    assert(milliseconds_ok);
    assert(nanoseconds_ok);

    print("unix seconds:      %\n", unix_seconds);
    print("unix milliseconds: %\n", unix_milliseconds);
    print("unix nanoseconds:  %\n", unix_nanoseconds);

    // Convert Unix seconds back to Apollo_Time.
    from_seconds :=
        APOLLO_TIME_FOR_JAN_1_1970
        + seconds_to_apollo(unix_seconds);

    // Convert Unix nanoseconds back to Apollo_Time.
    from_nanoseconds :=
        APOLLO_TIME_FOR_JAN_1_1970
        + nanoseconds_to_apollo(unix_nanoseconds);

    print(
        "from seconds:     %\n",
        calendar_to_iso_string(
            to_calendar(from_seconds, .UTC),
        ),
    );

    print(
        "from nanoseconds: %\n",
        calendar_to_iso_string(
            to_calendar(from_nanoseconds, .UTC),
        ),
    );
}
/*
now: 2026-09-02T05:55:35.959Z
unix seconds:      1788328535
unix milliseconds: 1788328535959
unix nanoseconds:  1788328535959400000
from seconds:     2026-09-02T05:55:35.000Z
from nanoseconds: 2026-09-02T05:55:35.959Z
*/