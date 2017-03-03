//
//  main.swift
//  Swift_继承
//
//  Created by caoxu on 2017/3/3.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

func testInheritance() {
    
    //基类
    class Base {
        var count = 0.0
        var description: String {
            return "count:\(count)"
        }
        
        //可继承
        func inherited() {
            
        }
        
        //防止继承
        final func preventing() {
            //如果不想子类继承 可在类 属性或方法前添加final
        }
    }
    
    
    //子类
    class Subclass: Base {
        
        //继承的属性和方法前都有override
        override var count:Double {
            didSet {
                print("\(#function)")
            }
        }
        
        override var description: String {
            return "\(#function)" + super.description
        }
        
        override func inherited() {
            print("\(#function)")
        }
    }
    
    let subclass = Subclass()
    
    subclass.count = 10
    print("\(subclass.description)")
    subclass.inherited()
    
    /*  print
     
     count
     descriptioncount:10.0
     inherited()
     
     */
}

func test() {
    testInheritance()
}

test()

