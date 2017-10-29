//
//  NSArray+TDDHelpers.m
//  InjectionTDD
//
//  Created by Bartosz Polaczyk on 28/10/2017.
//

#import "NSArray+TDDHelpers.h"

@implementation NSArray (TDD)

-(NSUInteger) tdd_sumUIntegersFromObjectsBlock:(NSUInteger (^)(id obj))block {
    __block NSUInteger sum = 0;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        sum += block(obj);
    }];
    return sum;
}
@end
