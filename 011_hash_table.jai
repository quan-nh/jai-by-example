#import "Basic";
#import "Hash_Table";

main :: () {
    // To create an empty table, declare a variable of type Table(Key_Type, Value_Type).
    // In Jai, tables allocate dynamic heap memory, so remember to free with deinit(*m).
    m: Table(string, int);
    defer deinit(*m);

    // Set key/value pairs using table_set(*table, key, value).
    // `table_set` inserts a new entry or overwrites the value if the key already exists.
    table_set(*m, "k1", 7);
    table_set(*m, "k2", 13);

    // Printing all key/value pairs by iterating over the table:
    // In Jai `for` loops on Table, `it` is the value and `it_index` is the key.
    // You can also name them explicitly: `for val, key: table`.
    print("map: {");
    first := true;
    for val, key: m {
        if !first print(", ");
        print("%: %", key, val);
        first = false;
    }
    print("}\n");
    // map: {k1: 7, k2: 13}
    
    // Look up a value for a key using `table_find`.
    // It returns two values: (value, success: bool).
    v1, success1 := table_find(*m, "k1");
    print("v1: %\n", v1); // v1: 7

    // If the key is not found, `success` will be false.
    v3, success3 := table_find(*m, "k3");
    print("v3 found: %\n", success3); // v3 found: false

    // `table.count` returns the number of key/value pairs in the table.
    print("len: %\n", m.count); // len: 2

    // `table_remove` removes a key/value pair from the table.
    // It returns (success: bool, removed_value).
    table_remove(*m, "k2");
    print("len after delete: %\n", m.count); // len after delete: 1

    // `table_contains` checks whether a key exists in the table.
    prs := table_contains(*m, "k2");
    print("prs: %\n", prs); // prs: false

    // `table_reset` clears all entries while keeping allocated capacity.
    table_reset(*m);
    print("len after reset: %\n", m.count); // len after reset: 0

    // Advanced: You can also look up a pointer using `table_find_pointer`
    // to modify the value directly in-place without rehashing.
    table_set(*m, "counter", 10);
    ptr := table_find_pointer(*m, "counter");
    if ptr {
        ptr.* += 5; // increment directly
    }
    val, _ := table_find(*m, "counter");
    print("counter: %\n", val); // counter: 15
}
