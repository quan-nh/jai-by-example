#import "Basic";
#import,dir "./Jaison";

Response :: struct {
    Page:     int;       @JsonName(page)
    Fruits:   [] string; @JsonName(fruits)
    Internal: bool;      @JsonIgnore
}

main :: () {
    // Jaison allocates decoded strings and arrays. Temporary allocation
    // is convenient when the decoded data is needed only during this task.
    {
        push_allocator(temp);
        run_example();
    }

    reset_temporary_storage();
}

run_example :: () {
    input := #string JSON
    {
        "page": 1,
        "fruits": ["apple", "peach"]
    }
    JSON

    success, response := json_parse_string(
        input,
        Response,
        ignore_unknown = false,
    );

    if !success {
        print("Could not decode JSON.\n");
        return;
    }

    print("page: %\n", response.Page);
    print("first fruit: %\n", response.Fruits[0]);

    // This field will not appear because it has @JsonIgnore.
    response.Internal = true;

    encoded := json_write_string(
        response,
        indent_char = "",
    );

    print("encoded: %\n", encoded);
}
/*
page: 1
first fruit: apple
encoded: {"page": 1,"fruits": ["apple","peach"]}
*/