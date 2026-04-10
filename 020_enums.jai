#import "Basic";

Fruits_We_Sell :: enum u32 {
    BANANA :: 5;
    APPLE;
    JOHANNISBEEREN;
    APRICOT :: 12;
    WATERMELON;
}

main :: () {
    // We can get lots of information about enums and their values at run-time.
    print("% contains the following values:\n", Fruits_We_Sell);
    for enum_values_as_s64(Fruits_We_Sell) {
        print("\t%: %\n", it, cast(Fruits_We_Sell) it);
    }
    
    low, high := enum_range(Fruits_We_Sell);
    print("\nIts values range from % to %\n", low, high);

    names := enum_names(Fruits_We_Sell);
    print("\nIts values as strings are: %\n", names);
}
/*
Fruits_We_Sell contains the following values:
	5: BANANA
	6: APPLE
	7: JOHANNISBEEREN
	12: APRICOT
	13: WATERMELON

Its values range from 5 to 13

Its values as strings are: ["BANANA", "APPLE", "JOHANNISBEEREN", "APRICOT", "WATERMELON"]
*/