//
//  TDDInjectionTestsObserver.m
//  InjectionTDD
//
//  Created by Bartosz Polaczyk on 28/10/2017.
//
#include <spawn.h>
#import "TDDInjectionTestsObserver.h"
#import "TDDSuiteResult.h"
#import "NSArray+TDDHelpers.h"

extern char **environ;

@interface TDDInjectionTestsObserver ()
@property (nonatomic, copy, nullable) NSString *currentSuiteName;
@property (nonatomic, assign) NSUInteger failuresCount;
@property (nonatomic, assign) NSUInteger allTestCasesCount;
@property (nonatomic, assign) NSUInteger failedTestCasesCount;
@property (nonatomic, assign) BOOL currentTestCaseFailed;

@property (nonatomic, strong) NSMutableArray<TDDSuiteResult *> *suiteResults;
@property (nonatomic, strong) NSOperation *resultsPresentationOperation;
@end

@implementation TDDInjectionTestsObserver

-(instancetype)init{
    if (self = [super init]){
        self.suiteResults = [NSMutableArray new];
    }
    return self;
}

-(void)resetCounters{
    self.failuresCount = 0;
    self.allTestCasesCount = 0;
    self.failedTestCasesCount = 0;
}

-(NSBlockOperation *)buildPresentationOperation{
    return [NSBlockOperation blockOperationWithBlock:^{
        [self presentSuiteResults:self.suiteResults];
        [self.suiteResults removeAllObjects];
    }];
    
}

-(void)presentSuiteResults:(NSArray<TDDSuiteResult *> *)suiteResults{
    if (!suiteResults.count){
        return;
    }
    NSUInteger allFailuresCount = [suiteResults tdd_sumUIntegersFromObjectsBlock:^NSUInteger(id obj) {
        return [obj totalFailuresCount];
    }];
    NSUInteger allCasesCount = [suiteResults tdd_sumUIntegersFromObjectsBlock:^NSUInteger(id obj) {
        return [obj totalCasesCount];
    }];
    NSUInteger allFailedCasesCount = [suiteResults tdd_sumUIntegersFromObjectsBlock:^NSUInteger(id obj) {
        return [obj totalFailedCasesCount];
    }];

    NSString *title = @"";
    if (suiteResults.count > 1){
        title = [NSString stringWithFormat:@"%lu suites", (unsigned long)suiteResults.count];
    }else {
        title = suiteResults.firstObject.suiteName;
    }

    if (allFailuresCount){
        [self failedWithTitle:title allFailedCasesCount:allFailedCasesCount allFailuresCount:allFailuresCount];
    }else{
        [self succeededWithTitle:title allCasesCount:allCasesCount];
    }
}

-(void)failedWithTitle:(NSString *)title allFailedCasesCount:(NSUInteger)allFailedCasesCount allFailuresCount:(NSUInteger)allFailuresCount{
    // consumed by Xcode breakpoint only
}

-(void)succeededWithTitle:(NSString *)title allCasesCount:(NSUInteger)allCasesCount{
    // consumed by Xcode breakpoint only
}



#pragma mark -

-(void)testSuiteWillStart:(XCTestSuite *)testSuite{
    if ([testSuite.name isEqualToString:self.currentSuiteName]){
        return;
    }
    [self.resultsPresentationOperation cancel];

    self.currentSuiteName = testSuite.name;
    [self resetCounters];
}
-(void)testSuiteDidFinish:(XCTestSuite *)testSuite{
    if (![self.currentSuiteName isEqualToString:testSuite.name]){
        return;
    }
    TDDSuiteResult *result = [[TDDSuiteResult alloc] initWithName:self.currentSuiteName totalFailuresCount:self.failuresCount totalCasesCount:self.allTestCasesCount totalFailedCasesCount:self.failedTestCasesCount];
    [self.suiteResults addObject:result];
    
    NSOperation *operation = [self buildPresentationOperation];
    self.resultsPresentationOperation = operation;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [NSOperationQueue.mainQueue addOperation:operation];
    });
    self.currentSuiteName = nil;
}

-(void)testCaseWillStart:(XCTestCase *)testCase{
    self.allTestCasesCount += 1;
    self.currentTestCaseFailed = NO;
}

-(void)testCase:(XCTestCase *)testCase didFailWithDescription:(NSString *)description inFile:(NSString *)filePath atLine:(NSUInteger)lineNumber{
    self.failuresCount += 1;
    self.currentTestCaseFailed = YES;
}

-(void)testCaseDidFinish:(XCTestCase *)testCase{
    if (self.currentTestCaseFailed){
        self.failedTestCasesCount += 1;
    }
}
@end
