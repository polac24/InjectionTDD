//
//  NSArray+TDDHelpers.h
//  InjectionTDD
//
//  Created by Bartosz Polaczyk on 28/10/2017.
//

#import <Foundation/Foundation.h>

@interface NSArray (TDD)
-(NSUInteger) tdd_sumUIntegersFromObjectsBlock:(NSUInteger (^)(id obj))block;
@end
