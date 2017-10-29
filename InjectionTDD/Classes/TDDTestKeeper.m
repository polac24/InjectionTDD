//
//  TDDTestKeeper.m
//  InjectionTDD
//
//  Created by Bartosz Polaczyk on 28/10/2017.
//

#import "TDDTestKeeper.h"
#import "TDDInjectionTestsObserver.h"

@implementation TDDTestKeeper

+ (BOOL) skipInjection{
    NSDictionary *environment = [[NSProcessInfo processInfo] environment];
    NSString *skipValue = [[environment objectForKey:@"INJECTION_TDD_SKIP"] uppercaseString];
    return [@[@"TRUE", @"YES"] containsObject:skipValue];
}
+(void)initialize{
    if ([self skipInjection]){
        return;
    }
    
    TDDInjectionTestsObserver *observer = [TDDInjectionTestsObserver new];
    [XCTestObservationCenter.sharedTestObservationCenter addTestObserver:observer];
    
    if (![[NSBundle bundleWithPath: @"/tmp/injectionforxcode/InjectionLoader.bundle"] load]) {
        NSLog (@"Warning: Injection for Xcode not found. Please open Injection For Xcode.");
    }else{
        NSLog(@"Ready for InjectionTDD...");
    }
    
    [NSRunLoop.currentRunLoop run];
    [XCTestObservationCenter.sharedTestObservationCenter removeTestObserver:observer];

}
@end
