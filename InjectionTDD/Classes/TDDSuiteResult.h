//
//  TDDSuiteResult.h
//  InjectionTDD
//
//  Created by Bartosz Polaczyk on 28/10/2017.
//

#import <Foundation/Foundation.h>

@interface TDDSuiteResult : NSObject
@property (nonatomic, readonly, copy) NSString *suiteName;
@property (nonatomic, readonly) NSUInteger totalFailuresCount;
@property (nonatomic, readonly) NSUInteger totalCasesCount;
@property (nonatomic, readonly) NSUInteger totalFailedCasesCount;

-(instancetype) initWithName:(NSString *)name totalFailuresCount:(NSUInteger)totalFailuresCount totalCasesCount:(NSUInteger)totalCasesCount totalFailedCasesCount:(NSUInteger)totalFailedCasesCount;
@end
