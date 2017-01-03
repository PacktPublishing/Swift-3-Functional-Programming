//: [Previous](@previous)
//: ### Modern syntax

/* ObjC

 // VerboseClass.h
 @interface VerboseClass: NSObject
 @property (nonatomic, strong) NSArray *ourArray;
 - (void)aMethod:(NSArray *)anArray;
 @end
 
 //  TestVerboseClass.m
 #import "VerboseClass.h"
 
 @interface TestVerboseClass : NSObject
 
 @end
 
 @implementation TestVerboseClass
 
 - (void)aMethod {
 VerboseClass *ourOBJClass = [[VerboseClass alloc] init];
 [ourOBJClass aMethod: @[@"One", @"Two", @"Three"]];
 }
 
 @end
 
 //  TestVerboseClass.m
 #import "VerboseClass.h"
 
 @interface TestVerboseClass : NSObject
 
 @end
 
 @implementation TestVerboseClass
 
 - (void)aMethod {
 VerboseClass *ourOBJCClass = [[VerboseClass alloc] init];
 [ourOBJCClass aMethod: @[@"One", @"Two", @"Three"]];
 NSLog(@"%@", ourOBJCClass.ourArray);
 }
 */



class ASwiftClass {
    var ourArray: [String] = []

    func aMethod(anArray: [String]) {
        self.ourArray  = anArray
    }
}

let aSwiftClassInstance = ASwiftClass()
aSwiftClassInstance.aMethod(anArray: ["one", "Two", "Three"])
print(aSwiftClassInstance.ourArray)
//: [Next](@next)
