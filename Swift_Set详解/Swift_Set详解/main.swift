//
//  main.swift
//  Swift_Set详解
//
//  Created by caoxu on 2017/3/1.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

//初始化
fileprivate func testInit() {
    //空Set
    var set = Set<String>()
    print(set)
    set = []
    print(set)
    
    //通过参数设置
    set = Set(["XuBaoAiChiYu","1045214799"])
    print(set)
    
    set = Set(arrayLiteral: "XuBaoAiChiYu","1045214799")
    print(set)
    
    set = Set(set)
    print(set)
    
    let set2: Set<String> = ["XuBaoAiChiYu","1045214799"]
    print(set2)
    
    /* print
     
     []
     []
     ["1045214799", "XuBaoAiChiYu"]
     ["1045214799", "XuBaoAiChiYu"]
     ["1045214799", "XuBaoAiChiYu"]
     ["1045214799", "XuBaoAiChiYu"]
     
     */
}

//相关属性
fileprivate func testProperties() {
    
    let set: Set<String> = ["iOS","XuBaoAiChiYu","1045214799"]
    print(set)
    
    print("count:\(set.count)") //有多少个元素
    print("first:\(set.first)") //顶部元素
    print("isEmpty:\(set.isEmpty)") //是否为空
    print("hashValue:\(set.hashValue)") //hash值
    
    //首位和末位
    var index = set.startIndex
    print("index:\(index)")
    
    index = set.endIndex
    print("index:\(index)")
    
    /*  print
     
     ["1045214799", "iOS", "XuBaoAiChiYu"]
     count:3
     first:Optional("1045214799")
     isEmpty:false
     hashValue:7244437487393105174
     index:SetIndex<String>(_value: Swift.SetIndexRepresentation<Swift.String>._native(Swift._NativeSetIndex<Swift.String>(nativeStorage: , offset: 0)))
     index:SetIndex<String>(_value: Swift.SetIndexRepresentation<Swift.String>._native(Swift._NativeSetIndex<Swift.String>(nativeStorage: , offset: 4)))
     
     */
}

//查找元素
fileprivate func testFindingObjects() {
    let set: Set<String> = ["iOS","XuBaoAiChiYu","1045214799"]
    print(set)
    
    //是否存在这个元素
    print("contains:\(set.contains("XuBaoAiChiYu"))")
    
    //查找位置
    var index = set.index(of: "XuBaoAiChiYu");
    print(index!)
    
    index = set.index(where: { (string) -> Bool in
        return string == "XuBaoAiChiYu"
    })
    print(index!)
    
    let string = set[index!]
    print(string)
    
    print("--------------")
    //无序遍历
    for item in set {
        print(item)
    }
    print("--------------")
    //有序遍历
    for item in set.sorted() {
        print(item)
    }
    print("--------------")
    
    /*  print
     
     ["1045214799", "iOS", "XuBaoAiChiYu"]
     contains:true
     SetIndex<String>(_value: Swift.SetIndexRepresentation<Swift.String>._native(Swift._NativeSetIndex<Swift.String>(nativeStorage: , offset: 3)))
     SetIndex<String>(_value: Swift.SetIndexRepresentation<Swift.String>._native(Swift._NativeSetIndex<Swift.String>(nativeStorage: , offset: 3)))
     XuBaoAiChiYu
     --------------
     1045214799
     iOS
     XuBaoAiChiYu
     --------------
     1045214799
     XuBaoAiChiYu
     iOS
     --------------
     
     */
    
}

//增加和删除
fileprivate func testAddAndRemove() {
    
    var set:Set<String> = ["iOS","XuBaoAiChiYu","1045214799"]
    print(set)
    
    set.insert("Swift") //增加
    print(set)
    
    var str = set.remove("Swift") //删除指定元素 并返回删除的元素
    print(str!)
    
    str = set.remove(at: set.index(of: "XuBaoAiChiYu")!) //根据位置删除
    print(str!)
    
    str = set.removeFirst() //删除首个
    print(str!)
    
    set.removeAll() //删除所有
    print(set)
    
    /*  print
     
     ["1045214799", "iOS", "XuBaoAiChiYu"]
     ["Swift", "iOS", "1045214799", "XuBaoAiChiYu"]
     Swift
     XuBaoAiChiYu
     iOS
     []
     
     */
}

//结合和重组
fileprivate func testCombiningAndRecombining() {
    
    let a:Set<String> = ["XuBaoAiChiYu", "1045214799", "swift"]
    print(a)
    let b:Set<String> = ["iOS", "1045214799", "swift"]
    print(b)
    let c:Set<String> = ["XuBaoAiChiYu", "1045214799", "swift", "iOS"]
    print(c)
    
    print("isEqual:\(a == b)") //是否相等
    print("isSubsetOf:\(a.isSubset(of: c))") //a是否是c的子集
    print("isSupersetOf:\(c.isSuperset(of: a))") //a是否是c的子集
    
    var set = a.intersection(b) //a交b 返回新set
    print(set)
    set = a.union(b)         //a并b
    print(set)
    set = a.subtracting(b)      //a差b 即a-a交b
    print(set)
    set = a.symmetricDifference(b)   //a并b-a交b
    print(set)
    
    // 不返回结果集，直接修改前set
    set.formIntersection(b)   //set交b,结果在set中
    print(set)
    set.formUnion(b)       //a并b
    print(set)
    set.subtract(b)    // a差b,即a-a交b
    print(set)
    set.formSymmetricDifference(b) //a并b-a交b
    print(set)
    
    /*  print
     
     ["swift", "1045214799", "XuBaoAiChiYu"]
     ["swift", "iOS", "1045214799"]
     ["iOS", "swift", "1045214799", "XuBaoAiChiYu"]
     isEqual:false
     isSubsetOf:true
     isSupersetOf:true
     ["swift", "1045214799"]
     ["iOS", "swift", "1045214799", "XuBaoAiChiYu"]
     ["XuBaoAiChiYu"]
     ["iOS", "XuBaoAiChiYu"]
     ["iOS"]
     ["swift", "iOS", "1045214799"]
     []
     ["swift", "iOS", "1045214799"]
     
     */
}

//排序
fileprivate func testSort() {
    let set:Set<String> = ["XuBaoAiChiYu", "1045214799", "swift", "iOS", "1045214799",]
    print(set)
    
    var array = set.sorted() //排序 升序
    print(array)
    
    array = set.sorted { (str1, str2) -> Bool in
        return str1 < str2
    }
    print(array)
    
    //简写
    array = set.sorted(by: { str1,str2 in str1 < str2 })
    print(array)
    
    array = set.sorted(by: {$0 > $1})
    print(array)
    
    array = set.sorted(by: >)
    print(array)
    
    /*  print
     
     ["iOS", "swift", "1045214799", "XuBaoAiChiYu"]
     ["1045214799", "XuBaoAiChiYu", "iOS", "swift"]
     ["1045214799", "XuBaoAiChiYu", "iOS", "swift"]
     ["1045214799", "XuBaoAiChiYu", "iOS", "swift"]
     ["swift", "iOS", "XuBaoAiChiYu", "1045214799"]
     ["swift", "iOS", "XuBaoAiChiYu", "1045214799"]
     
     */
}

fileprivate func test() {
    //    testInit() //初始化
    //    testProperties() //相关属性
    //    testFindingObjects() //查找元素
    //    testAddAndRemove() //增加和删除
    //    testCombiningAndRecombining() //结合和重组
    testSort() //排序
}

test()
