/**
 *  InjectionTDD
 *  Copyright (c) 2017 Bartosz Polaczyk
 *  Licensed under the MIT license, see LICENSE file
 */


import XCTest

public class InjectionTDDTestsObserver:NSObject, XCTestObservation{
    struct SuiteResults{
        var failures:Int
        var testCases:Int
        var failedTestCases:Int
        var name:String
    }
    
    var suites:Set<String> = []
    var failures = 0
    var testCases = 0
    var failedTestCases = 0
    var failedCurrentTestCase = false
    var finishedSuites = [SuiteResults]()
    var operation:Operation?
    
    func finishedSuccessed(_ name: NSString, testCases: Int){}
    func finishedWithError(_ name: NSString, failedTestCases: Int, failures: Int){}
    
    public func testSuiteWillStart(_ testSuite: XCTestSuite) {
        operation?.cancel()
        
        suites.insert(testSuite.name)
        failures = 0
        testCases = 0
        failedTestCases = 0
    }
    public func testSuiteDidFinish(_ testSuite: XCTestSuite) {
        guard suites.contains(testSuite.name) else {
            return
        }
        suites.remove(testSuite.name)
        let safeName = testSuite.name.replacingOccurrences(of: "\"", with: "")
        let results = SuiteResults(failures: failures, testCases: testCases, failedTestCases: failedTestCases, name: safeName)
        finishedSuites.append(results)
        
        let operation = BlockOperation {[finishedSuites] in
            self.presentSuiteResults(results: finishedSuites)
            self.finishedSuites = []
        }
        self.operation = operation
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            OperationQueue.main.addOperation(operation)
        }
    }
    
    
    public func testCaseWillStart(_ testCase: XCTestCase) {
        testCases += 1
        failedCurrentTestCase = false
    }
    
    public func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
        failures += 1
        failedCurrentTestCase = true
    }
    
    public func testCaseDidFinish(_ testCase: XCTestCase) {
        if failedCurrentTestCase {
            failedTestCases += 1
        }
    }
    
    private func presentSuiteResults(results:[SuiteResults]){
        guard results.count > 0 else{
            return
        }
        let failures = results.reduce(0, {$0+$1.failures})
        let testCases = results.reduce(0, {$0+$1.testCases})
        let failedTestCases = results.reduce(0, {$0+$1.failedTestCases})
        let subtitle:NSString
        if (results.count > 1){
            subtitle = "\(results.count) suites" as NSString
        }else{
            subtitle = (results.first?.name ?? "") as NSString
        }
        
        if failures > 0{
            finishedWithError(subtitle, failedTestCases: failedTestCases, failures: failures)
        }else{
            finishedSuccessed(subtitle, testCases: testCases)
        }
    }
}


class TestKeeper: XCTestCase {
    
    var observer: InjectionTDDTestsObserver = {
        let observer = InjectionTDDTestsObserver()
        XCTestObservationCenter.shared.addTestObserver(observer)
        
        if (Bundle(path: "/tmp/injectionforxcode/InjectionLoader.bundle")?.load()) != true {
            print ("Warning: Injection for Xcode not found")
        }
        print("Ready for InjectionTDD...")
        
        RunLoop.current.run()
        return observer
    }()
    
    deinit {
        XCTestObservationCenter.shared.removeTestObserver(observer)
    }
    
    // Required to init TestKeeper during reflection lookup
    func testEmpty(){
    }
}

