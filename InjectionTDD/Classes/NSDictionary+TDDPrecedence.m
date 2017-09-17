/**
 *  InjectionTDD
 *  Copyright (c) 2017 Bartosz Polaczyk
 *  Licensed under the MIT license, see LICENSE file
 */

#import "NSDictionary+TDDPrecedence.h"
#import <objc/runtime.h>

static NSString *const kPrecedenceMarker = @"InjectionTDD";

@implementation NSDictionary (TDDPrecedence)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self patchTDDFrameworkTDDPrecedence];
    });
}


+ (void) patchTDDFrameworkTDDPrecedence{
    Class cfStringClass = NSClassFromString(@"__NSDictionaryM");
    Class stringClass = [self class];
    
    SEL originalSelector = @selector(enumerateKeysAndObjectsWithOptions:usingBlock:);
    SEL swizzledSelector = @selector(precedence_enumerateKeysAndObjectsWithOptions:usingBlock:);
    
    Method originalMethod = class_getInstanceMethod(cfStringClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(stringClass, swizzledSelector);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
}
#pragma mark - Method Swizzling

-(void)precedence_enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id _Nonnull, id _Nonnull, BOOL * _Nonnull))block{
    
    NSArray *sortedKeys = [[self allKeys] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        BOOL obj1Precedence = NO;
        BOOL obj2Precedence = NO;
        if ([obj1 isKindOfClass:[NSString class]] && [obj1 containsString:kPrecedenceMarker]){
            obj1Precedence = YES;
        }
        if ([obj2 isKindOfClass:[NSString class]] && [obj2 containsString:kPrecedenceMarker]){
            obj2Precedence = YES;
        }
        if (obj1Precedence == obj2Precedence){
            return NSOrderedSame;
        }
        return obj1Precedence ? NSOrderedAscending : NSOrderedDescending;
    }];
    
    for (id key in sortedKeys){
        BOOL stop = NO;
        block(key, self[key], &stop);
        if (stop){
            return;
        }
    }
}

@end
