//
//  ExampleStruct.swift
//  InjectionTDD
//
//  Created by Bartosz Polaczyk on 24/09/2017.
//  Copyright © 2017 Bartosz Polaczyk. All rights reserved.
//

import UIKit

struct ExampleStruct {
    var property1:String
    var property2:String
    
    func concatenated () -> String{
        return "\(property1)\(property2)"
    }
}
