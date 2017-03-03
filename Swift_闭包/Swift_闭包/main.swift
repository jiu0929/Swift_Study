//
//  main.swift
//  Swift_闭包
//
//  Created by caoxu on 2017/3/2.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

//闭包优化
func testClosures() {
    //函数做参数 排序
    let names = ["XuBaoAiChiYu", "1045214799", "iOS", "Swift", "OC"]
    func backwards(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    var reversed = names.sorted(by: backwards)
    print(reversed)
    
    //闭包排序
    reversed = names.sorted(by: { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
    print(reversed)
    
    //可以写为一行
    reversed = names.sorted( by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
    print(reversed)
    
    //闭包可以自动判断参数类型和返回属性
    reversed = names.sorted( by: { s1, s2 in return s1 > s2 } )
    print(reversed)
    
    //当只有一行时，可省略return写法。
    reversed = names.sorted( by: { s1, s2 in s1 > s2 } )
    print(reversed)
    
    //闭包中的参数可使用$去获得 第一个参数为$0 第二个为$1
    reversed = names.sorted( by: { $0 > $1 } )
    print(reversed)
    
    //当闭包中只有两个参数 做比较操作时 只需要写入符号
    reversed = names.sorted(by: >)
    print("\(reversed)")
    
    /*  print
     
     ["iOS", "XuBaoAiChiYu", "Swift", "OC", "1045214799"]
     ["iOS", "XuBaoAiChiYu", "Swift", "OC", "1045214799"]
     ["iOS", "XuBaoAiChiYu", "Swift", "OC", "1045214799"]
     ["iOS", "XuBaoAiChiYu", "Swift", "OC", "1045214799"]
     ["iOS", "XuBaoAiChiYu", "Swift", "OC", "1045214799"]
     ["iOS", "XuBaoAiChiYu", "Swift", "OC", "1045214799"]
     ["iOS", "XuBaoAiChiYu", "Swift", "OC", "1045214799"]
     
     */
}

//testClosures()

//尾随闭包
func testTrailingClosures() {
    
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
    //如果函数需要一个闭包作为参数，且这个参数是最后一个参数.
    //尾随闭包可以放在函数参数列表外，也就是括号外
    var reversed = names.sorted() { $0 > $1 }
    print("\(reversed)")
    
    //如果一个闭包表达式作为一个唯一的参数，你又正在使用尾随闭包，可以省略()
    reversed = names.sorted { $0 > $1 }
    print("\(reversed)")
    
    /*  print
     
     ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
     ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
     
     */
}

//testTrailingClosures()

//捕获值
func testCapturingValues() {
    /*
     闭包可以根据环境上下文捕获到定义的常量和变量。闭包可以引用和修改这些捕获到的常量和变量，
     就算在原来的范围内定义为常量或者变量已经不再存在（很牛逼）。
     在Swift中闭包的最简单形式是嵌套函数。
     */
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    
    let incrementByTen = makeIncrementer(forIncrement: 10)
    print("\(incrementByTen())")
    print("\(incrementByTen())")
    print("\(incrementByTen())")
    
    let incrementBySeven = makeIncrementer(forIncrement: 7)
    print("\(incrementBySeven())")
    print("\(incrementByTen())")
    
    //闭包是引用类型
    let alsoIncrementByTen = incrementByTen
    print(alsoIncrementByTen())
    
    /*  print
     
     10
     20
     30
     7
     40
     50
     
     */
}

//testCapturingValues()

//避免内存泄露
var completionHandlers: [() -> Void] = []
func someFunctionWithNoescapeClosure(_ closure: () -> Void) {
    closure()
//    completionHandlers.append(closure) //会报错 closure无法被保存
}

func someFunctionWithEscapingClosure(_ completionHandler: @escaping () -> Void) {
    completionHandler()
    completionHandlers.append(completionHandler)
}

class SomeClass {
    var x = 10
    func doSomething() {
        //内存溢出
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNoescapeClosure { x = 200 }
    }
}
func testNonescapingClosures() {
    //@noescape 保留环问题 闭包中布应使用self 避免内存泄露
    let instance = SomeClass()
    instance.doSomething()
    print(instance.x)
    
    completionHandlers.first?()
    print(instance.x)
    
    /*  print
     
     200
     100
     
     */
}

//testNonescapingClosures()

