//
//  main.swift
//  Swift_销毁
//
//  Created by caoxu on 2017/3/6.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

func test() {
    
    class SomeClass {
        
        //类销毁时 通知此方法
        deinit {
            print("销毁")
        }
        
    }
    
    var sClass:SomeClass? = SomeClass()
    sClass = nil
}

test()

