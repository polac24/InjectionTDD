//
//  ViewControllerTests.swift
//  InjectionTDDTests
//
//  Created by Bartosz Polaczyk on 28/10/2017.
//  Copyright © 2017 Bartosz Polaczyk. All rights reserved.
//

import XCTest
@testable import InjectionTDD

class ViewControllerTests: XCTestCase {
    
    func testClassFunction(){
        XCTAssertEqual(ViewController().someFunction(), "A")
    }
}
