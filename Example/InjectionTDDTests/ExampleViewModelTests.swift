//
//  ExampleViewModelTests.swift
//  InjectionTDDTests
//
//  Created by Bartosz Polaczyk on 24/09/2017.
//  Copyright © 2017 Bartosz Polaczyk. All rights reserved.
//

import XCTest
@testable import InjectionTDD

class ExampleViewModelTests: XCTestCase {
    
    func testExampleFunction(){
        XCTAssertEqual(ExampleViewModel().someFunction(), "ExampleVM")
    }
    
    func testExtensionFunction(){
         XCTAssertEqual(ExampleViewModel().extraFunction(), "extra")
    }
    
}
