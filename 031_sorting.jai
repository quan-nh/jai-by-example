#import "Basic";
#import "Sort";

main :: () {
    // Sort strings alphabetically.
    strings := string.["c", "a", "b"];
    quick_sort(strings, compare_strings);
    print("Strings: %\n", strings); // Strings: [a, b, c]

    // Sort integers from lowest to highest.
    integers := int.[7, 2, 4];
    quick_sort(integers, value => value);
    print("Ints:    %\n", integers); // Ints:    [2, 4, 7]

    // Check whether the integers are sorted.
    sorted := is_sorted(integers, value => value);
    print("Sorted:  %\n", sorted); // Sorted:  true
}

// The Sort module does not currently provide an is_sorted procedure,
// so we can define a small generic helper.
is_sorted :: (array: [] $T, key: (T) -> $K) -> bool {
    if array.count < 2 return true;

    for 1..array.count-1 {
        previous := key(array[it - 1]);
        current  := key(array[it]);

        if previous > current return false;
    }

    return true;
}
