//
//  main.swift
//  Swift_可选链
//
//  Created by caoxu on 2017/3/6.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

//可选链
func test() {
    class Person {
        //可选属性可能为nil或Residence类
        var residence: Residence?
    }
    
    class Residence {
        var numberOfRooms = 1
    }
    
    let john = Person()
    john.residence = Residence()
    
    //可选获得
    var roomCount = john.residence?.numberOfRooms
    
    print(roomCount)
    
    //强制获得
    roomCount = john.residence!.numberOfRooms
    
    print(roomCount)
    
    // if获得
    if let roomCount = john.residence?.numberOfRooms {
        print(roomCount)
    }
    
    /*  print
     
     Optional(1)
     Optional(1)
     1
     
     */
}

test()

