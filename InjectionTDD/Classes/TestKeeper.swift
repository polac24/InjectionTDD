/**
 *  InjectionTDD
 *  Copyright (c) 2017 Bartosz Polaczyk
 *  Licensed under the MIT license, see LICENSE file
 */


import XCTest

public class InjectionTDDTestsObserver:NSObject, XCTestObservation{
    
    var suites:Set<String> = []
    var failures = 0
    var testCases = 0
    var failedTestCases = 0
    var failedCurrentTestCase = false
    
    func finishedSuccessed(_ name: String){}
    func finishedWithError(_ name: String){}
    
    public func testSuiteWillStart(_ testSuite: XCTestSuite) {
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
        failures > 0 ? finishedWithError(safeName) : finishedSuccessed(safeName)
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
}


class TestKeeper: XCTestCase {
    
    var observer: InjectionTDDTestsObserver = {
        let observer = InjectionTDDTestsObserver()
        XCTestObservationCenter.shared.addTestObserver(observer)
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

