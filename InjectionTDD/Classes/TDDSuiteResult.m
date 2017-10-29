//
//  TDDSuiteResult.m
//  InjectionTDD
//
//  Created by Bartosz Polaczyk on 28/10/2017.
//

#import "TDDSuiteResult.h"

@interface TDDSuiteResult ()
@property (nonatomic, readwrite, copy) NSString *suiteName;
@property (nonatomic, readwrite) NSUInteger totalFailuresCount;
@property (nonatomic, readwrite) NSUInteger totalCasesCount;
@property (nonatomic, readwrite) NSUInteger totalFailedCasesCount;
@end

@implementation TDDSuiteResult

-(instancetype)initWithName:(NSString *)name totalFailuresCount:(NSUInteger)totalFailuresCount totalCasesCount:(NSUInteger)totalCasesCount totalFailedCasesCount:(NSUInteger)totalFailedCasesCount{
    if (self = [super init]){
        self.suiteName = name;
        self.totalFailuresCount = totalFailuresCount;
        self.totalCasesCount = totalCasesCount;
        self.totalFailedCasesCount = totalFailedCasesCount;
    }
    return self;
}
@end
