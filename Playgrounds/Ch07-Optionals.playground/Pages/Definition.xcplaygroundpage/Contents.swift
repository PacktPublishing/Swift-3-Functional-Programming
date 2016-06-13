//: [Previous](@previous)

import Foundation

// Optional value either contains a value or contains nil
var optionalString: String? = "A String literal"
optionalString = nil

var aString: String = "A String literal"
// aString = nil // Compile error

/* ObjC

 NSString *searchedItem = [self searchItem:@"an item"];
 NSString *text = @"Found item: ";
 NSString *message = [text stringByAppendingString:searchedItem];
 
*/

enum Optional<T> {
    case None
    case Some(T)
}

//: [Next](@next)
