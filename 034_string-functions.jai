#import "Basic";
s :: #import "String";

main :: () {
    // These operations allocate persistent memory, so free their results.
    joined := s.join("a", "b", separator="-");
    defer free(joined);

    replaced, replacement_count := s.replace("foo", "o", "0");
    defer free(replaced);

    // split uses temporary storage. Its strings are views into the input.
    parts := s.split("a-b-c-d-e", "-");

    print("Contains:   %\n", s.contains("test", "es"));
    print("HasPrefix:  %\n", s.begins_with("test", "te"));
    print("HasSuffix:  %\n", s.ends_with("test", "st"));
    print("Index:      %\n", s.find_index_from_left("test", "e"));
    print("Join:       %\n", joined);
    print("Replace:    %\n", replaced);
    print("Split:      %\n", parts);
    print("ToLower:    %\n", s.to_lower_copy("TEST"));
    print("ToUpper:    %\n", s.to_upper_copy("test"));
}
/*
Contains:   true
HasPrefix:  true
HasSuffix:  true
Index:      1
Join:       a-b
Replace:    f00
Split:      ["a", "b", "c", "d", "e"]
ToLower:    test
ToUpper:    TEST
*/