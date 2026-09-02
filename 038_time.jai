#import "Basic";

WEEKDAYS :: string.[
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
];

main :: () {
    // Get the current wall-clock time.
    now := current_time_consensus();
    now_calendar := to_calendar(now, .UTC);

    print("now: %\n", calendar_to_iso_string(now_calendar));

    // Construct a specific UTC calendar time.
    then_calendar := Calendar_Time.{
        year                       = 2009,
        month_starting_at_0        = 10, // November
        day_of_month_starting_at_0 = 16, // November 17
        hour                       = 20,
        minute                     = 34,
        second                     = 58,
        millisecond                = 651,
        time_zone                  = .UTC
    };

    past := calendar_to_apollo(then_calendar);

    // Calendar_Time only stores milliseconds. Apollo_Time has enough
    // precision to represent the remaining nanoseconds separately.
    past += nanoseconds_to_apollo(387_237);

    // Convert back to populate fields such as day_of_week.
    normalized_then := to_calendar(past, .UTC);

    print("then: %\n", calendar_to_iso_string(normalized_then));

    // Extract calendar components.
    print("year:        %\n", normalized_then.year);
    print("month:       %\n", normalized_then.month_starting_at_0 + 1);
    print("day:         %\n", normalized_then.day_of_month_starting_at_0 + 1);
    print("hour:        %\n", normalized_then.hour);
    print("minute:      %\n", normalized_then.minute);
    print("second:      %\n", normalized_then.second);
    print("millisecond: %\n", normalized_then.millisecond);
    print("timezone:    %\n", normalized_then.time_zone);

    weekday := WEEKDAYS[normalized_then.day_of_week_starting_at_0];
    print("weekday:     %\n", weekday);

    // Compare times directly.
    print("before now: %\n", past < now);
    print("after now:  %\n", past > now);
    print("equal now:  %\n", past == now);

    // Subtracting two Apollo_Time values produces another Apollo_Time,
    // which can be treated as a duration.
    difference := now - past;

    difference_seconds, converted :=
        to_float64_seconds(difference);

    assert(converted);

    print("hours:       %\n", difference_seconds / 3600.0);
    print("minutes:     %\n", difference_seconds / 60.0);
    print("seconds:     %\n", difference_seconds);

    nanoseconds, fits_in_s64 := to_nanoseconds(difference);

    if fits_in_s64 {
        print("nanoseconds: %\n", nanoseconds);
    } else {
        print("nanoseconds: duration is too large for an s64\n");
    }

    // Add and subtract durations.
    future := past + difference;
    earlier := past - difference;

    print(
        "then + difference: %\n",
        calendar_to_iso_string(to_calendar(future, .UTC)),
    );

    print(
        "then - difference: %\n",
        calendar_to_iso_string(to_calendar(earlier, .UTC)),
    );
}
/*
now: 2026-09-02T05:54:17.114Z
then: 2009-11-17T20:34:58.651Z
year:        2009
month:       11
day:         17
hour:        20
minute:      34
second:      58
millisecond: 651
timezone:    UTC
weekday:     Tuesday
before now: true
after now:  false
equal now:  false
hours:       147177.321795
minutes:     8830639.307706
seconds:     529838358.462369
nanoseconds: 529838358462368763
then + difference: 2026-09-02T05:54:17.114Z
then - difference: 1993-02-02T11:15:40.189Z
*/