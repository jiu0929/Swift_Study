//
//  main.swift
//  Swift_初始化
//
//  Created by caoxu on 2017/3/3.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

//初始化结构体
func testInitStruct() {
    //结构体 类中默认方法
    struct Size {
        //宽
        var width = 0.0
        //高
        var height = 0.0
    }
    
    //默认初始化 使用的是init()构造方法
    var size = Size()
    //结构体自带根据成员初始化结构体的功能
    size = Size(width: 10, height: 10)
    print(size)
    
    struct Point {
        
        var x = 0.0, y = 0.0
        
        //默认初始化
        init() {
            
        }
        
        //通过成员初始化结构体
        init(x:Double, y:Double) {
            self.x = x
            self.y = y
        }
    }
    
    //自定义初始化
    var point = Point() //调用inin()方法
    point = Point(x: 10, y: 10) //调用init(x: Double, y:Double)方法
    print(point)
    
    /*  print
     
     (Size #1)(width: 10.0, height: 10.0)
     (Point #1)(x: 10.0, y: 10.0)
     
     */
    
}

//初始化枚举
func testInitEnum() {
    
    enum CompassPoint:String {
        
        case North, South, East, West
        
        init(symbol: String) {
            switch symbol {
            case "North":
                self = .North
            case "South":
                self = .South
            case "East":
                self = .East
            default:
                self = .West
            }
        }
        
    }
    
    //直接取值
    var compassPoint = CompassPoint.West
    print(compassPoint)
    //通过原始值初始化
    compassPoint = CompassPoint(rawValue: "North")!
    print(compassPoint)
    //通过自定义的初始化方法
    compassPoint = CompassPoint(symbol: "North")
    print(compassPoint)
    
    /*  print
     
     West
     North
     North
     
     */
}

//初始化类
func testInitClass() {
    
    class BaseClass {
        
        var name: String? //可选属性类型 可能为String或nil
        
        init() {
            print("Food:init()")
        }
        
        convenience init(name: String) {
            self.init()
            self.name = name
        }
        
        //省略外部参数
        convenience init(_ subName: String) {
            self.init(name: subName)
        }
    }
    
    class SubClass: BaseClass {
        
        override init() {
            super.init() //实现父类的init()方法
        }
        
    }
    
    //默认初始化
    var user = SubClass()
    //通过属性初始化
    user = SubClass(name: "XuBaoAiChiYu")
    //使用init(_ name: String)初始化
    user = SubClass("XuBaoAiChiYu")
//    var name = ""
//    name = user.name //因为name可以为nil。此处会报错，
    if let name = user.name {
        print(name)
    }
    
    /*  print
     
     Food:init()
     Food:init()
     Food:init()
     XuBaoAiChiYu
     
     */
}

//结构体初始化失败
func testFailableInitStruct() {
    struct Animal {
        let species: String
        init?(species: String) {
            if species.isEmpty { return nil }
            self.species = species
        }
    }
    let someCreature = Animal(species: "Giraffe")
    //someCreature is of type Animal?, not Animal
    if let giraffe = someCreature {
        print("\(giraffe.species)")
    }
    
    /*  print
     
     Giraffe
     
     */
}

//枚举初始化失败
func testFailableInitEnum() {
    
    enum TemperatureUnit:Character {
        
        case kelvin = "K", celsius = "C", fahrenheit = "F"
        
        init?(symbol: Character) {
            switch symbol {
            case "K":
                self = .kelvin
            case "C":
                self = .celsius
            case "F":
                self = .fahrenheit
            default:
                return nil
            }
        }
        
    }
    //通过自定义方法初始化
    var unit = TemperatureUnit(symbol: "F")
    print(unit!) //Fahrenheit
    unit = TemperatureUnit(symbol: "X")
    print(unit) //nil
    
    //通过原始值初始化
    unit = TemperatureUnit(rawValue: "F")
    print(unit!) //Fahrenheit
    unit = TemperatureUnit(rawValue: "X")
    print(unit) //nil
    
    /*
     
     fahrenheit
     nil
     fahrenheit
     nil
     
     */
    
}

//类初始化失败
func testFailableInitClass() {
    
    class Product {
        
        var name: String?
        
        init() {}
        
        init?(name: String) {
            self.name = name
            if name.isEmpty {
                return nil
            }
        }
    }
    //可选链操作 当bowTie为真时 执行内部代码
    if let qq = Product(name: "1045214799") {
        print(qq.name!)
    }
    
    /*
     
     Optional("1045214799")
     
     */
}

//必须初始化
func testRequiredInit() {
    
    class SomeClass {
        
        required init() {
            //子类要调用此方法，必须继承实现
        }
        
    }
    
    class SomeSubclass: SomeClass {
        
        required init() {
            
        }
        
        init(required:String) {
            super.init()
            //这里调用父类的init()方法 当前类必须实现init()方法
        }
    }
}

//使用闭包或函数设置默认属性
func testSettingDefaultPropertyValueWithClosureOrFunction() {
    class SomeClass {
        
        let someProperty: String = {
            //create a default value for someProperty inside this closure
            //someValue must be of the same type as SomeType
            return "someValue"
        }()
    }
    
    let c = SomeClass()
    print(c.someProperty)
    
    /*  print
     
     someValue
     
     */
    
}

func test() {
//    testInitStruct()
//    testInitEnum()
//    testInitClass()
//    testFailableInitStruct()
//    testFailableInitEnum()
//    testFailableInitClass()
//    testRequiredInit()
    testSettingDefaultPropertyValueWithClosureOrFunction()
}

test()
