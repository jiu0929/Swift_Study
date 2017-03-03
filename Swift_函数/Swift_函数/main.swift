//
//  main.swift
//  Swift_函数
//
//  Created by caoxu on 2017/3/2.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

//定义和调用函数
func testDefiningAndCallingFunctions() {
    func sayHello(_ personName: String) -> String {
        let greeting = "Hello " + personName + "!"
        return greeting
    }
    print(sayHello("XuBaoAiChiYu"))
    
    /*  print
     
     Hello XuBaoAiChiYu!
     
     */
}

//testDefiningAndCallingFunctions()

//无参数函数
func testFunctionsWithoutParameters() {
    //无参数 只有一个String类型的返回值
    func sayHelloWorld() -> String {
        return "hello world!"
    }
    print(sayHelloWorld())
    
    /*  print
     
     hello world!
     
     */
}

//testFunctionsWithoutParameters()

//多参数函数
func testFunctionsWithMultipleParameters() {
    //传入两个参数 并返回一个String类型的数据
    func sayHello(_ personName: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return "Hello again \(personName)!"
        } else {
            return "Hello \(personName)!"
        }
    }
    print(sayHello("XuBaoAiChiYu", alreadyGreeted: true))
    
    /*  print
     
     Hello again XuBaoAiChiYu!
     
     */
}

//testFunctionsWithMultipleParameters()

//函数无返回值
func testFunctionsWithoutReturnValues() {
    //传入一个String类型的数据 不返回任何数据
    func sayGoodbye(_ personName: String) {
        print("Goodbye \(personName)!")
    }
    sayGoodbye("XuBaoAiChiYu")
    
    /*  print
     
     Goodbye XuBaoAiChiYu!
     
     */
}

//testFunctionsWithoutReturnValues()

//函数多返回值
func testMultipleReturnValues() {
    //返回一个Int类型的数据
    func printAndCount(_ stringToPrint: String) -> Int {
        print(stringToPrint)
        return stringToPrint.characters.count
    }
    print(printAndCount("hello world"))
    
    //返回元组合数据
    func minMax(_ array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
    let bounds = minMax([8, -6, 2, 109, 3, 71])
    print("min is \(bounds.min) and max is \(bounds.max)")
    
    /*  print
     
     hello world
     11
     min is -6 and max is 109
     
     */
}

//testMultipleReturnValues()

//返回类型可选
func testOptionalTupleReturnTypes() {
    //返回一个元组或Nil
    func minMax(_ array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty {
            return nil
        }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    if let bounds = minMax([8, -6, 2, 109, 3, 71]) {
        print("min is \(bounds.min) and max is \(bounds.max)")
    }
    
    /*  print
     
     min is -6 and max is 109
     
     */
}

//testOptionalTupleReturnTypes()

//指定外部参数名
func testSpecifyingExternalParameterNames() {
    //指定外部参数名to和and
    func sayHello(to person: String, and anotherPerson: String) -> String {
        return "Hello \(person) and \(anotherPerson)!"
    }
    print(sayHello(to: "Bill", and: "Ted"))
    
    /*  print
     
     Hello Bill and Ted!
     
     */
}

//testSpecifyingExternalParameterNames()

//省略外部参数名
func testOmittingExternalParameterNames() {
    //使用 _ 省略外面参数名，
    func someFunction(_ firstParameterName: Int, _ secondParameterName: Int) {
        print("\(firstParameterName) and \(secondParameterName)")
    }
    someFunction(2, 3)
    
    /*  print
     
     2 and 3
     
     */
}

//testOmittingExternalParameterNames()

//默认参数值
func testDefaultParameterValues() {
    //设置默认值 当用户不传入时 使用默认值
    func someFunction(_ parameterWithDefault: Int = 12) {
        print("\(parameterWithDefault)")
    }
    someFunction(6)
    someFunction()
    
    /*  print
     
     6
     12
     
     */
}

//testDefaultParameterValues()

//可变参数
func testVariadicParameters() {
    //传入的参数类型已知Double 个数未知
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    print("\(arithmeticMean(1, 2, 3, 4, 5))")
    print("\(arithmeticMean(3, 8.25, 18.75))")
    
    /*  print
     
     3.0
     10.0
     
     */
}

//testVariadicParameters()

//常量和变量参数
func testConstantAndVariableParameters() {
    //默认为let常量参数 也可声明var可变参数 在函数内直接修改
    func alignRight(_ string: String, totalLength: Int, pad: Character) -> String {
        var string = string
        let amountToPad = totalLength - string.characters.count
        if amountToPad < 1 {
            return string
        }
        let padString = String(pad)
        for _ in 1...amountToPad {
            string = padString + string
        }
        return string
    }
    let originalString = "hello"
    let paddedString = alignRight(originalString, totalLength: 10, pad: "-")
    
    print("originalString:\(originalString); paddedString:\(paddedString);")
    
    /*  print
     
     originalString:hello; paddedString:-----hello;
     
     */
}

//testConstantAndVariableParameters()

//In-Out参数
func testInOutParameters() {
    //使用inout声明的参数 在函数内修改参数值时 外面参数值也会变
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    var someInt = 3
    var anotherInt = 107
    swapTwoInts(&someInt, &anotherInt)
    print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
    
    /*  print
     
     someInt is now 107, and anotherInt is now 3
     
     */
}

//testInOutParameters()

//使用函数类型
func testUsingFunctionTypes() {
    //加法
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    //乘法
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    // 函数体赋值为参数
    var mathFunction: (Int, Int) -> Int = addTwoInts
    print("Result: \(mathFunction(2, 3))")
    
    // 函数体指向替换
    mathFunction = multiplyTwoInts
    print("Result: \(mathFunction(2, 3))")
    
    // 函数体传递
    let anotherMathFunction = addTwoInts
    print("\(anotherMathFunction)")
    
    /*  print
     
     Result: 5
     Result: 6
     (Function)
     
     */
}

//testUsingFunctionTypes()

//函数做参数类型
func testFunctionTypesAsParameterTypes() {
    //加法
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    //其中一个参数为一个函数体
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    
    printMathResult(addTwoInts, 3, 5)
    
    /*  print
     
     Result: 8
     
     */
}

//testFunctionTypesAsParameterTypes()

//函数做返回类型
func testFunctionTypesAsReturnTypes() {
    //加1
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    //减1
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    //使用函数体做返回类型
    func chooseStepFunction(_ backwards: Bool) -> (Int) -> Int {
        return backwards ? stepBackward : stepForward
    }
    
    var currentValue = 3
    
    // 此时moveNearerToZero指向stepForward函数
    let moveNearerToZero = chooseStepFunction(currentValue > 0)
    
    // 调用函数体
    currentValue = moveNearerToZero(currentValue)
    print("\(currentValue)... ")
    
    /*  print
     
     2...
     
     */
}

//testFunctionTypesAsReturnTypes()

//嵌套函数
func testNestedFunctions() {
    //函数体内部嵌套函数 并做返回类型
    func chooseStepFunction(_ backwards: Bool) -> (Int) -> Int {
        //嵌套函数
        func stepForward(_ input: Int) -> Int {
            return input + 1
        }
        //嵌套函数
        func stepBackward(_ input: Int) -> Int {
            return input - 1
        }
        return backwards ? stepBackward : stepForward
    }
    
    var currentValue = -2
    
    let moveNearerToZero = chooseStepFunction(currentValue > 0)
    currentValue = moveNearerToZero(currentValue)
    
    print("\(currentValue)... ")
    
    /*  print
     
     -1...
     
     */
}

//testNestedFunctions()
