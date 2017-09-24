//
//  InjectionTDDTests.swift
//  InjectionTDDTests
//
//  Created by Bartosz Polaczyk on 16/09/2017.
//  Copyright © 2017 Bartosz Polaczyk. All rights reserved.
//

import XCTest
@testable import InjectionTDD

class InjectionTDDTests: XCTestCase {
    
    func testClassFunction(){
        XCTAssertEqual(ViewController().someFunction(), "A")
    }
    
}
