//
//  main.swift
//  Swift_字典详解
//
//  Created by caoxu on 2017/3/1.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

//初始化
fileprivate func testInit() {
    //空字典
    var dic = [String:String]()
    print(dic)
    
    dic = [:]
    print(dic)
    
    dic = Dictionary()
    print(dic)
    
    dic = Dictionary<String,String>()
    print(dic)
    
    //非空字典
    dic = ["name":"XuBaoAiChiYu","QQ":"1045214799"]
    print(dic)
    
    dic = Dictionary(dictionaryLiteral: ("name","XuBaoAiChiYu"),("QQ","1045214799"))
    print(dic)
    
    /*  print
     
     [:]
     [:]
     [:]
     [:]
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     
     */
}

//相关属性
fileprivate func testProperties() {
    
    let dic = ["name":"XuBaoAiChiYu","QQ":"1045214799"]
    print(dic)
    
    print("count:\(dic.count)") // 有多个对元素
    print("isEmpty:\(dic.isEmpty)") // 是否为空
    
    // 获取所有key
    let keys = [String](dic.keys)
    print("keys:\(keys)")
    
    // 获取所有value
    let values = [String](dic.values)
    print("values:\(values)")
    
    print("startIndex:\(dic.startIndex)") // 首脚标
    print("endIndex:\(dic.endIndex)")     // 尾脚标
    
    /*  print
     
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     count:2
     isEmpty:false
     keys:["name", "QQ"]
     values:["XuBaoAiChiYu", "1045214799"]
     startIndex:DictionaryIndex<String, String>(_value: Swift.DictionaryIndexRepresentation<Swift.String, Swift.String>._native(Swift._NativeDictionaryIndex<Swift.String, Swift.String>(nativeStorage: , offset: 1)))
     endIndex:DictionaryIndex<String, String>(_value: Swift.DictionaryIndexRepresentation<Swift.String, Swift.String>._native(Swift._NativeDictionaryIndex<Swift.String, Swift.String>(nativeStorage: , offset: 4)))
     
     */
}

//查找元素
fileprivate func testFindingObjects() {
    let dic = ["name":"XuBaoAiChiYu","QQ":"1045214799"]
    print(dic)
    
    if let dicIndex = dic.index(forKey: "name") { // 获取位置
        let item = dic[dicIndex] // 根据位置获取键值对
        print("key:\(item.0);value:\(item.1)")
    }
    
    let value = dic["name"] // 根据key提取Value
    print("value:\(value)")
    
    // 遍历输出
    for (key, value) in dic {
        print("\(key): \(value)")
    }
    
    // 所有key输出
    for key in dic.keys {
        print("key:\(key)")
    }
    
    // 所有value输出
    for value in dic.values {
        print("value: \(value)")
    }
    
    /*  print
     
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     key:name;value:XuBaoAiChiYu
     value:Optional("XuBaoAiChiYu")
     name: XuBaoAiChiYu
     QQ: 1045214799
     key:name
     key:QQ
     value: XuBaoAiChiYu
     value: 1045214799
     
     */
}

//增加元素
fileprivate func testAdd() {
    var dic = ["name":"XuBaoAiChiYu","QQ":"1045214799"]
    print(dic)
    
    // 如果没有则添加，有则修改
    dic["language"] = "swift"
    print(dic)
    
    /*  print
     
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     ["language": "swift", "name": "XuBaoAiChiYu", "QQ": "1045214799"]
     
     */
}

//删除元素
fileprivate func testRemove() {
    var dic = ["name":"XuBaoAiChiYu","QQ":"1045214799"]
    print(dic)
    
    let oldValue = dic.removeValue(forKey: "name")// 根据key删除,并返回删除的value
    print("\(oldValue)")
    
    // 先找到位置，然后根据位置删除
    if let dictIndex = dic.index(forKey: "QQ") {
        let oldItem = dic.remove(at: dictIndex)// 返回删除的元素对
        print("key:\(oldItem.0);value:\(oldItem.1)")
    }
    
    dic.removeAll() // 删除所有元素
    print(dic)
    
    /*  print
     
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     Optional("XuBaoAiChiYu")
     key:QQ;value:1045214799
     [:]
     
     */
}

//修改元素
fileprivate func testReplace() {
    var dic = ["name":"XuBaoAiChiYu","QQ":"1045214799"]
    print(dic)
    
    // 如果没有则添加，有则修改
    dic["name"] = "XUBAO" // 修改
    print(dic)
    
    let oldValue = dic.updateValue("XUBAOAICHIYU", forKey: "name") // 修改，并返回原来的value
    print("\(oldValue)")
    
    /*  print
     
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     ["name": "XUBAO", "QQ": "1045214799"]
     Optional("XUBAO")
     
     */
}

//排序
fileprivate func testSort() {
    let dic = ["name":"XuBaoAiChiYu","QQ":"1045214799"]
    print(dic)
    
    // 排序主要只排序key或者value,然后借用Array的排序
    // 排序key
    var array = dic.keys.sorted(by: { str1,str2 in str1 < str2 })
    array = dic.keys.sorted(by: <)
    print(array)
    
    // 排序value
    array = dic.values.sorted(by: {$0 > $1})
    print(array)
    
    /*  print
     
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     ["QQ", "name"]
     ["XuBaoAiChiYu", "1045214799"]
     
     */
}

//文件读写
fileprivate func testReadingAndWriting() {
    // Document目录
    let documents:[String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    let docDirPath = documents.first!
    let path = (docDirPath as NSString).appendingPathComponent("test.plist")
    let url = URL(fileURLWithPath: path)
    var dic = ["name":"XuBaoAiChiYu","QQ":"1045214799"]
    
    // 写
    (dic as NSDictionary).write(toFile: path, atomically: true)
    (dic as NSDictionary).write(to: url, atomically: true)
    
    // 读
    dic = NSDictionary(contentsOfFile: path) as! Dictionary
    print(dic)
    dic = NSDictionary(contentsOf: url) as! Dictionary
    print(dic)
    
    /*  print
     
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     ["name": "XuBaoAiChiYu", "QQ": "1045214799"]
     
     */
}

fileprivate func test() {
    //    testInit() //初始化
    //    testProperties() //相关属性
    //    testFindingObjects() //查找元素
    //    testAdd() //增加元素
    //    testRemove() //删除元素
    //    testReplace() //修改元素
    //    testSort() //排序
    testReadingAndWriting() //文件读写
}

test()
