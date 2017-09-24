//
//  ExampleStructTests.swift
//  InjectionTDDTests
//
//  Created by Bartosz Polaczyk on 24/09/2017.
//  Copyright © 2017 Bartosz Polaczyk. All rights reserved.
//

import XCTest
@testable import InjectionTDD

class ExampleStructTests: XCTestCase {
    
    func testConcatenation() {
        // arrange
        let sample = ExampleStruct(property1: "v1", property2: "v2")
        
        // act
        let concatenation = sample.concatenated()
        
        // assert
        XCTAssertEqual(concatenation, "v1v2")
    }
    
    func testPropertyMutation(){
        // arrange
        var sample = ExampleStruct(property1: "v1", property2: "v2")
        
        // act
        sample.property1 = "new"
        
        // assert
        let concatenation = sample.concatenated()
        XCTAssertEqual(concatenation, "newv2")
    }
    
}
