//
//  main.swift
//  Swift_扩展
//
//  Created by caoxu on 2017/3/6.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

//扩展
class Extensions: NSObject {
    
    func test() {
        
        let oneInch = 25.4.mm
        print("One inch is \(oneInch) meters")
        //prints "One inch is 0.0254 meters"
        let threeFeet = 3.ft
        print("Three feet is \(threeFeet) meters")
        //prints "Three feet is 0.914399970739201 meters"
        
    }
}

let extensions = Extensions()
extensions.test()

