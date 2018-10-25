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

    NSString *injectionForXcode = @"/tmp/injectionforxcode";
    NSString *injectionIII = @"/Applications/InjectionIII.app/Contents/Resources/";

#if TARGET_OS_IPHONE
    NSString *platformString = @"iOSInjection{version}.bundle";
#endif
#if TARGET_OS_TVOS
    NSString *platformString = @"tvOSInjection{version}.bundle";
#endif
#if TARGET_OS_MACOS
    NSString *platformString = @"macOSInjection{version}.bundle";
#endif

    NSArray *paths = [NSArray arrayWithObjects:
                      injectionForXcode,
                      injectionIII,
                      nil];

    BOOL isDirectory = NO;
    BOOL loaded = NO;
    for (NSString *path in paths) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory]) {
            if ([path isEqualToString:injectionIII]) {
                NSString *bundlePath = [path stringByAppendingString:[platformString stringByReplacingOccurrencesOfString:@"{version}"
                                                                                                               withString:@"10"]];
                BOOL xcodeWasLoaded = [[NSBundle bundleWithPath:bundlePath] load];
                if (xcodeWasLoaded) {
                    loaded = xcodeWasLoaded;
                } else {
                    bundlePath = [path stringByAppendingString:[platformString stringByReplacingOccurrencesOfString:@"{version}"
                                                                                                         withString:@""]];
                    loaded = [[NSBundle bundleWithPath:bundlePath] load];
                }
            } else {
                loaded = [[NSBundle bundleWithPath: [path stringByAppendingString:@"/InjectionLoader.bundle"]] load];
            }
            break;
        }
    }

    if (loaded) {
        NSLog(@"Ready for InjectionTDD...");
    } else {
        NSLog (@"Warning: Injection for Xcode not found. Please open Injection For Xcode.");
    }

    [NSRunLoop.currentRunLoop run];
    [XCTestObservationCenter.sharedTestObservationCenter removeTestObserver:observer];

}
@end
