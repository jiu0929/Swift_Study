//
//  main.swift
//  Swift_下标
//
//  Created by caoxu on 2017/3/3.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

func testSubscripts() {
    
    //下标关键字subscript
    //array测试
    struct TestArray {
        
        //内部数组
        var array = Array<Int>()
        
        //下标使用
        subscript(index: Int) -> Int {
            get {
                assert(index < array.count, "下标越界")
                return array[index]
            }
            set {
                while array.count <= index {
                    array.append(0)
                }
                array[index] = newValue
            }
        }
    }
    
    var array = TestArray()
    
    array[3] = 4; //通过下标设置值
    
    print(array)
    
    print("\(array[3])") //4
    print("\(array[4])") //程序停止
}

func test() {
    testSubscripts()
}

test()
