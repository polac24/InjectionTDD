/**
 *  InjectionTDD
 *  Copyright (c) 2017 Bartosz Polaczyk
 *  Licensed under the MIT license, see LICENSE file
 */

#import "NSString+TDDPrecedence.h"
#import <objc/runtime.h>


@implementation NSString (TDDPrecedence)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self patchTDDFrameworkTDDPrecedence];
    });
}


+ (void) patchTDDFrameworkTDDPrecedence{
    Class cfStringClass = NSClassFromString(@"__NSCFString");
    Class stringClass = [self class];
    
    SEL originalSelector = @selector(hash);
    SEL swizzledSelector = @selector(precedence_hash);
    
    Method originalMethod = class_getInstanceMethod(cfStringClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(stringClass, swizzledSelector);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
}
#pragma mark - Method Swizzling

- (NSUInteger)precedence_hash {
    return [self containsString:@"InjectionTDD"] ? 0 : [self precedence_hash];
}

@end
