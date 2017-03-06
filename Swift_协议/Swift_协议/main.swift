//
//  main.swift
//  Swift_协议
//
//  Created by caoxu on 2017/3/6.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

@objc protocol SomeProtocol:class {
    
    //class代表只用类才能实现这个协议
    func test()
    
    //@objc:OC特性 代表可以使用optional特性 optional可选的方法
    @objc optional func testOptional()
    
}

protocol AnotherProtocol: SomeProtocol {
    
    //协议可继承
    
}

//协议扩展
extension SomeProtocol {
    
    func testExtension() {
        print(#function)
    }
    
}

class SomeClass:NSObject, SomeProtocol {
    
    func test() {
        print(#function)
    }
    
}

/*
 
 test()
 testExtension()
 
 */


let someClass = SomeClass()
someClass.test()
someClass.testExtension()

