//
//  main.swift
//  Swift_枚举
//
//  Created by caoxu on 2017/3/2.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

///空枚举
enum SomeEnumeration {
    // enumeration definition goes here
}

//枚举基本类型
enum CompassPoint {
    case north
    case south
    case east
    case west
}

//简写
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//枚举语法
func testEnumerationSyntax() {
    
    //使用
    var directionToHead = CompassPoint.west
    //可不写 前面的枚举名
    directionToHead = .east
    print("\(directionToHead)")
    
    /*  print
     
     east
     
     */
}

//testEnumerationSyntax()

//枚举匹配
func testMatchingEnumeration() {
    
    var directionToHead = CompassPoint.south
    
    //if匹配
    if directionToHead == CompassPoint.south {
        directionToHead = .east
    }
    
    //switch匹配
    switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    case .east:
        print("Where the sun rises")
    default:
        print("default")
    }
    
    /*  print
     
     Where the sun rises
     
     */
}

//testMatchingEnumeration()

//关联值
func testAssociatedValues() {
    //枚举可以和结构体类型的数据关联使用
    enum Barcode {
        case upca(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    // 初始化
    var productBarcode = Barcode.upca(8, 85909, 51226, 3)
    productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
    
    //匹配
    switch productBarcode {//有警告 要求是常数
    case .upca(let numberSystem, let manufacturer, let product, let check):
        print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
    }
    
    //可以不写let
    switch productBarcode {
    case let .upca(numberSystem, manufacturer, product, check):
        print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
    }
    
    /*  print
     
     QR code: ABCDEFGHIJKLMNOP.
     QR code: ABCDEFGHIJKLMNOP.
     
     */
}

//testAssociatedValues()

//原始值
func testRawValues() {
    enum ASCIIControlCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    
    //隐式分配原始值
    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    //原始值为属性名转换
    enum CompassPoint: String {
        case North, South, East, West
    }
    
    print("\(Planet.earth.rawValue)")
    print("\(CompassPoint.West.rawValue)")
    
    // 通过原始值初始化
    let possiblePlanet = Planet(rawValue: 7)
    print("\(possiblePlanet)")
    let positionToFind = 9
    print("\(possiblePlanet)")
    
    // 当原始值不匹配时，返回为nil
    if let somePlanet = Planet(rawValue: positionToFind) {
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
    } else {
        print("There isn't a planet at position \(positionToFind)")
    }
    
    /*  print
     
     3
     West
     Optional(Swift_枚举.(testRawValues () -> ()).(Planet #1).uranus)
     Optional(Swift_枚举.(testRawValues () -> ()).(Planet #1).uranus)
     There isn't a planet at position 9
     
     */
}

//testRawValues()

//枚举循环
func testRecursiveEnumerations() {
    //indirect循环关键字
    //            enum ArithmeticExpression {
    //                case Number(Int)
    //                indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    //                indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
    //            }
    
    // 可将indirect写到枚举前
    indirect enum ArithmeticExpression {
        case number(Int) // 值
        case addition(ArithmeticExpression, ArithmeticExpression)       // 加
        case multiplication(ArithmeticExpression, ArithmeticExpression) // 乘
    }
    
    // 函数使用
    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case .number(let value):
            return value
        case .addition(let left, let right):
            return evaluate(left) + evaluate(right)
        case .multiplication(let left, let right):
            return evaluate(left) * evaluate(right)
        }
    }
    
    // evaluate (5 + 4) * 2
    let five = ArithmeticExpression.number(5)
    let four = ArithmeticExpression.number(4)
    let sum = ArithmeticExpression.addition(five, four)
    let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
    print(evaluate(product))
    
    /*  print
     
     18
     
     */
}

//testRecursiveEnumerations()
