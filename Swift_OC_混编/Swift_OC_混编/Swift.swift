//
//  Swift.swift
//  Swift_OC_混编
//
//  Created by caoxu on 2017/3/14.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Cocoa

class Swift: NSObject {
    func test(_ string:String) {
        print("Swift:\(string)")
        let oc = Objective()
        oc.test(string)
    }
}
