/**
 *  InjectionTDD
 *  Copyright (c) 2017 Bartosz Polaczyk
 *  Licensed under the MIT license, see LICENSE file
 */


import XCTest

@objc
public class InjectionTDDTestsObserver:NSObject, XCTestObservation{
    
    var suites:Set<String> = []
    var failures = 0
    var testCases = 0
    var failedTestCases = 0
    var failedCurrentTestCase = false
    
    func finishedSuccessed(_ name: String){}
    func finishedWithError(_ name: String){}
    
    public func testSuiteWillStart(_ testSuite: XCTestSuite) {
        if let name = testSuite.name{
            suites.insert(name)
        }
        failures = 0
        testCases = 0
        failedTestCases = 0
    }
    
    public func testSuiteDidFinish(_ testSuite: XCTestSuite) {
        guard let name = testSuite.name, suites.contains(name) else {
            return
        }
        suites.remove(name)
        let safeName = name.replacingOccurrences(of: "\"", with: "")
        failures > 0 ? finishedWithError(safeName) : finishedSuccessed(safeName)
    }
    
    
    public func testCaseWillStart(_ testCase: XCTestCase) {
        testCases += 1
        failedCurrentTestCase = false
    }
    
    public func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        failures += 1
        failedCurrentTestCase = true
    }
    
    public func testCaseDidFinish(_ testCase: XCTestCase) {
        if failedCurrentTestCase {
            failedTestCases += 1
        }
    }
}

@objc
class TestKeeper: XCTestCase {
    
    lazy var observer: InjectionTDDTestsObserver = {
        NSDictionary.patchTDDFrameworkTDDPrecedence()
        
        let observer = InjectionTDDTestsObserver()
        XCTestObservationCenter.shared().addTestObserver(observer)
        return observer
    }()
    
    deinit {
        XCTestObservationCenter.shared().removeTestObserver(observer)
    }
    
    func testToBeginTDD(){
        _ = observer
        RunLoop.current.run()
    }
}
