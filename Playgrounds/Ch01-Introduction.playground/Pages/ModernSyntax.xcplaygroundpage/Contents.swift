//: [Previous](@previous)
//: ### Modern syntax

/* ObjC
 //  VerboseClass.h
 @interface VerboseClass: NSObject
 @property (nonatomic, strong) NSMutableArray *ourArray;
 - (void)aMethod:(NSMutableArray *)anArray;
 @end
 
 //  VerboseClass.m
 #import "VerboseClass.h"
 
 @implementation VerboseClass
 - (void)aMethod:(NSMutableArray *)anArray {
 self.ourArray = [[NSMutableArray alloc] initWithArray:@[@"One", @"Two", @"Three"]];
 }
 */

class aSwiftClass {
    var ourArray:[String] = []
    func aMethod(anArray: [String]) {
        self.ourArray  = ["one", "Two", "Three"]
    }
}

//: [Next](@next)
