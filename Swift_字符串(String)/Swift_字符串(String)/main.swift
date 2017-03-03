//
//  main.swift
//  Swift_字符串(String)
//
//  Created by caoxu on 2017/2/28.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

//类型别名
fileprivate func testTypeAliases() {
    let index = String.Index.self
    print("\(index)")
    
    let utf8index = String.UTF8Index.self
    print("\(utf8index)")
    
    let utf16index = String.UTF16Index.self
    print("\(utf16index)")
    
    let unicodeScalarIndex = String.UnicodeScalarIndex.self
    print("\(unicodeScalarIndex)")
    
    let greeting = "XuBaoAiChiYu"
    print(greeting[greeting.startIndex])//输出字符串的第一个字符
    print(greeting[greeting.characters.index(before: greeting.endIndex)])//输出字符串的最后一个字符
    print(greeting[greeting.characters.index(after: greeting.startIndex)])//输出字符串的第二个字符
    print(greeting[greeting.characters.index(greeting.startIndex, offsetBy: 7)])//输出字符串的第八个字符
    
    /*  print
     
     Index
     Index
     Index
     Index
     X
     u
     u
     C
     
     */
}

//初始化
fileprivate func testInitializers() {
    
    //初始化
    var string: String = String()
    string = "XuBaoAiChiYu"
    
    print(string)
    
    //char 初始化
    let char: Character = "X"
    string = String(char)
    print(string)
    string = String.init(char)
    print(string)
    string = "\(char)"
    print(string)
    
    // 通过CharacterView
    let charView: String.CharacterView = String.CharacterView("XuBaoAiChiYu")
    string = String(charView)
    print(string)
    
    //通过 utf-16 编码
    let utf16: String.UTF16View = string.utf16
    string = String(describing: utf16)
    print(utf16)
    
    //通过 utf-8 编码
    let utf8: String.UTF8View = string.utf8
    string = String(describing: utf8)
    print(utf8)
    
    //通过多个字符串组合生成
    string = String(stringInterpolation: "xu", "bao")
    print(string)
    
    //char初始化 连续count次
    string = String(repeating: String(char), count: 6)
    print(string)
    
    //通过其他常用数据初始化
    string = String(stringInterpolationSegment: true)
    print(string)
    string = String(stringInterpolationSegment: 24)
    print(string)
    
    // 通过NSString初始化,不推荐
    string = NSString(string: "XuBaoAiChiYu") as String
    print(string)
    string = NSString.init(string: "XuBaoAiChiYu") as String
    print(string)
    
    // 组合生成
    string = NSString(format: "%@", "XuBaoAiChiYu") as String
    print(string)
    
    /*  print
     
     XuBaoAiChiYu
     X
     X
     X
     XuBaoAiChiYu
     XuBaoAiChiYu
     XuBaoAiChiYu
     xubao
     XXXXXX
     true
     24
     XuBaoAiChiYu
     XuBaoAiChiYu
     XuBaoAiChiYu
     
     */
    
}

//文件路径操作
fileprivate func testWorkingWithPaths() {
    
    var path = "xubaoaichiyu/ios/swift"
    print(path)
    
    //路径分割成熟数组
    var pathComponents = (path as NSString).pathComponents
    print(pathComponents)
    
    //数组组合成路径
    path = NSString.path(withComponents: pathComponents)
    print(path)
    
    //Document目录
    let documents: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true)
    print(documents)
    let documentPath: String = documents.first!
    print(documentPath)
    
    //寻找文件夹下包含多少个路径
    var complete = documentPath.completePath(caseSensitive: true)
    print(complete)
    
    //寻找文件夹下包含指定扩展名的文件路径个数
    var outName = ""
    let filterTypes = ["txt", "plist"]
    complete = documentPath.completePath(into: &outName, caseSensitive: true, matchesInto: &pathComponents, filterTypes: filterTypes)
    print("completePathIntoString:\(complete)")
    
    //添加路径
    path = (documentPath as NSString).appendingPathComponent("test")
    print(path)
    //添加扩展
    path = (path as NSString).appendingPathExtension("plist")!
    print(path)
    
    print("是否绝对路径:\((path as NSString).isAbsolutePath)")
    print("最后一个路径名:\((path as NSString).lastPathComponent)")
    print("扩展名:\((path as NSString).pathExtension)")
    
    //去掉扩展名
    var tempPath = (path as NSString).deletingPathExtension
    print(tempPath)
    //去掉最后一个路径
    tempPath = (path as NSString).deletingLastPathComponent
    print(tempPath)
    
    //转%格式码
    let allowedCharacters:CharacterSet = CharacterSet.controlCharacters
    tempPath = path.addingPercentEncoding(withAllowedCharacters: allowedCharacters)!
    print(tempPath)
    
    //转可见
    tempPath = (tempPath as NSString).removingPercentEncoding!
    print(tempPath)
    
    /*  print
     
     xubaoaichiyu/ios/swift
     ["xubaoaichiyu", "ios", "swift"]
     xubaoaichiyu/ios/swift
     ["/Users/caoxu/Documents"]
     /Users/caoxu/Documents
     4
     completePathIntoString:1
     /Users/caoxu/Documents/test
     /Users/caoxu/Documents/test.plist
     是否绝对路径:true
     最后一个路径名:test.plist
     扩展名:plist
     /Users/caoxu/Documents/test
     /Users/caoxu/Documents
     %2F%55%73%65%72%73%2F%63%61%6F%78%75%2F%44%6F%63%75%6D%65%6E%74%73%2F%74%65%73%74%2E%70%6C%69%73%74
     /Users/caoxu/Documents/test.plist
     
     */
    
}

//文件读写操作
fileprivate func testFile() {
    
    var string = "XuBaoAiChiYu"
    
    //Document目录
    let documents = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    var path = documents.first!
    path = (path as NSString).appendingPathComponent("xubaoaichiyu")
    path = (path as NSString).appendingPathExtension("text")!
    let pathUrl = URL(fileURLWithPath: path)
    
    do {
        //写入
        try string.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
        try string.write(to: pathUrl, atomically: true, encoding: String.Encoding.utf8)
        
        // 读取
        // 自动解析
        try string = String(contentsOfFile: path)
        print(string)
        // 指定编码解析
        try string = String(contentsOfFile: path, encoding: String.Encoding.utf8)
        print(string)
        // 使用默认的编码解析 如果不能解析 采取默认解析并返回解析编码
        var encoding:String.Encoding = String.Encoding.utf16LittleEndian
        try string = String(contentsOfFile: path, usedEncoding: &encoding)
        print(string)
        
        // URl 读取
        try string = String(contentsOf: pathUrl)
        print(string)
        try string = String(contentsOf: pathUrl, encoding: String.Encoding.utf8)
        print(string)
        try string = String(contentsOf: pathUrl, usedEncoding: &encoding)
        print(string)
    } catch {
        print("错误:\(error)")
    }
    
    /*  print
     
     XuBaoAiChiYu
     XuBaoAiChiYu
     XuBaoAiChiYu
     XuBaoAiChiYu
     XuBaoAiChiYu
     XuBaoAiChiYu
     
     */
}

//获取字符串的Swift属性
fileprivate func testGettingProperties() {
    let string = String(stringInterpolation: "XuBaoAiChiYu", "QQ", "1045214799")
    
    // String.CharacterView
    print("String.CharacterView:\(string.characters)")
    
    // String.UnicodeScalarView
    print("String.UnicodeScalarView:\(string.unicodeScalars)")
    
    // String.UTF16View
    print("String.UTF16View:\(string.utf16)")
    
    // String.UTF8View
    print("String.UTF8View:\(string.utf8)")
    
    // hash值
    print("hashValue:\(string.hashValue)")
    
    // 是否为空
    print("isEmpty:\(string.isEmpty)")
    
    /*  print
     
     String.CharacterView:CharacterView(_core: Swift._StringCore(_baseAddress: Optional(0x0000000100b06e80), _countAndFlags: 24, _owner: Optional(Swift._HeapBufferStorage<Swift._StringBufferIVars, Swift.UInt16>)))
     String.UnicodeScalarView:XuBaoAiChiYuQQ1045214799
     String.UTF16View:XuBaoAiChiYuQQ1045214799
     String.UTF8View:XuBaoAiChiYuQQ1045214799
     hashValue:-8659559252040524018
     isEmpty:false
     
     */
}

//获取字符串长度
fileprivate func testGettingLength() {
    var string: String = String()
    string = "XuBaoAiChiYu: 1045214799"
    
    // 起始位置
    var index =  string.startIndex
    print(index)
    
    // 结束位置
    index = string.endIndex
    print(index)
    
    // NSString方式获取长度
    var length = (string as NSString).length
    print(length)
    
    // swift方式获取
    length = string.characters.distance(from: string.startIndex, to: string.endIndex)
    print(length)
    
    // 通过编码获取长度
    length = string.lengthOfBytes(using: String.Encoding.utf8)
    print(length)
    
    /*  print
     
     Index(_base: Swift.String.UnicodeScalarView.Index(_position: 0), _countUTF16: 1)
     Index(_base: Swift.String.UnicodeScalarView.Index(_position: 24), _countUTF16: 0)
     24
     24
     24
     
     */
}
//大小写变化
fileprivate func testChangingCase() {
    var string = "XuBaoAiChiYu QQ 1045214799"
    print(string)
    
    //大写
    string = string.uppercased()
    print(string)
    
    //小写
    string = string.lowercased()
    print(string)
    
    /* print
     
     XuBaoAiChiYu QQ 1045214799
     XUBAOAICHIYU QQ 1045214799
     xubaoaichiyu qq 1045214799
     
     */
    
}
//字符串转数值
fileprivate func testGettingNumericValues() {
    
    let string = "24"
    print(string)
    let nStr = string as NSString // 借用NSString输出
    print(nStr)
    
    print("doubleValue:\(nStr.doubleValue)")
    print("floatValue:\(nStr.floatValue)")
    print("intValue:\(nStr.intValue)")
    print("integerValue:\(nStr.integerValue)")
    print("longLongValue:\(nStr.longLongValue)")
    print("boolValue:\(nStr.boolValue)")
    
    /* print
     
     24
     24
     doubleValue:24.0
     floatValue:24.0
     intValue:24
     integerValue:24
     longLongValue:24
     boolValue:true
     
     */
}
//增加字符串
fileprivate func testCombiningStrings() {
    
    var string = "XuBaoAiChiYu QQ 1045214799"
    print(string)
    
    //添加字符串
    string.append("_Swift")
    print(string)
    
    string += "_Swift"
    print(string)
    
    string.write("_Swift")
    print(string)
    
    //string后增加字符串并生成一个新的字符串
    string = string + string
    print(string)
    
    //string后增加组合字符串并生成一个新的字符串
    string = string.appendingFormat("_%@", "OC")
    print(string)
    
    //string后增加循环字符串，stringByPaddingToLength：完毕后截取的长度；startingAtIndex：从增加的字符串第几位开始循环增加。
    string = string.padding(toLength: 30, withPad:"_Swift", startingAt:3)
    print(string)
    
    //指定位置插入Character
    string.insert("5", at: string.characters.index(string.endIndex, offsetBy: -1))
    print(string)
    
    //指定位置插入字符串
    string.insert(contentsOf: "78".characters, at: string.characters.index(string.startIndex, offsetBy: 9))
    print(string)
    
    /*  print
     
     XuBaoAiChiYu QQ 1045214799
     XuBaoAiChiYu QQ 1045214799_Swift
     XuBaoAiChiYu QQ 1045214799_Swift_Swift
     XuBaoAiChiYu QQ 1045214799_Swift_Swift_Swift
     XuBaoAiChiYu QQ 1045214799_Swift_Swift_SwiftXuBaoAiChiYu QQ 1045214799_Swift_Swift_Swift
     XuBaoAiChiYu QQ 1045214799_Swift_Swift_SwiftXuBaoAiChiYu QQ 1045214799_Swift_Swift_Swift_OC
     XuBaoAiChiYu QQ 1045214799_Swi
     XuBaoAiChiYu QQ 1045214799_Sw5i
     XuBaoAiCh78iYu QQ 1045214799_Sw5i
     
     */
}
//分割字符串
fileprivate func testDividingStrings() {
    let str = "XuBaoAiChiYu_QQ_1045214799"
    
    //根据指定的字符串分割成数组
    var array = str.components(separatedBy: "_")
    print(array)
    
    //通过系统自带的分割方式分割字符串
    array = str.components(separatedBy: CharacterSet.lowercaseLetters)
    print(array)
    
    // 指定位置后的字符串
    var tempStr = str.substring(from: str.characters.index(str.startIndex, offsetBy: 3))
    print(tempStr)
    
    // 指定位置前的字符串
    tempStr = str.substring(to: str.characters.index(str.startIndex, offsetBy: 3))
    print(tempStr)
    
    // 指定范围的字符串
    let range = str.characters.index(str.endIndex, offsetBy: -6)..<str.endIndex
    tempStr = str.substring(with: range)
    print(tempStr)
    
    /*  print
     
     ["XuBaoAiChiYu", "QQ", "1045214799"]
     ["X", "B", "", "A", "C", "", "Y", "_QQ_1045214799"]
     aoAiChiYu_QQ_1045214799
     XuB
     214799
     
     */
}

//查找字符串
fileprivate func testFindingStrings() {
    
    let str = "XuBaoAiChiYu_QQ_1045214799";
    let searchRange = str.startIndex ..< str.characters.index(str.startIndex, offsetBy: 10)
    print(searchRange)
    
    //根据NSCharacterSet查找
    let cSet = CharacterSet.uppercaseLetters
    var range = str.rangeOfCharacter(from: cSet)
    print(range!)
    
    //根据字符串查找
    range = str.range(of: "Yu")
    print(range!)
    range = str.range(of: "Yu", options: NSString.CompareOptions.caseInsensitive, range: searchRange, locale: nil)
    if let tempRange = range {
        print("tempRange:\(tempRange)")
    }
    
    //block 行查找
    str.enumerateLines { (line, stop) -> () in
        print(line)
        if "Yu" == line {
            stop = true
        }
    }
    
    //block查找 可设置查找方式 并得到找到的位置
    str.enumerateSubstrings(in: searchRange, options: NSString.EnumerationOptions.byComposedCharacterSequences) { (substring, substringRange, enclosingRange, stop) -> () in
        print(substring!)
        if "A" == substring {
            print(substringRange)
            stop = true
        }
    }
    
    /* print
     
     Index(_base: Swift.String.UnicodeScalarView.Index(_position: 0), _countUTF16: 1)..<Index(_base: Swift.String.UnicodeScalarView.Index(_position: 10), _countUTF16: 1)
     Index(_base: Swift.String.UnicodeScalarView.Index(_position: 0), _countUTF16: 1)..<Index(_base: Swift.String.UnicodeScalarView.Index(_position: 1), _countUTF16: 1)
     Index(_base: Swift.String.UnicodeScalarView.Index(_position: 10), _countUTF16: 1)..<Index(_base: Swift.String.UnicodeScalarView.Index(_position: 12), _countUTF16: 1)
     XuBaoAiChiYu_QQ_1045214799
     X
     u
     B
     a
     o
     A
     Index(_base: Swift.String.UnicodeScalarView.Index(_position: 5), _countUTF16: 1)..<Index(_base: Swift.String.UnicodeScalarView.Index(_position: 6), _countUTF16: 1)
     
     */
}
//替换字符串
fileprivate func testReplacingSubstrings() {
    
    var string = "XuBaoAiChiYu_QQ_1045214799"
    let replacingRange = string.startIndex..<string.characters.index(string.startIndex, offsetBy: 20)
    print(string)
    
    //全局替换
    string = string.replacingOccurrences(of: "+", with: " ")
    print(string)
    //设置替换的模式 并设置范围
    string = string.replacingOccurrences(of: "+", with: "_", options: NSString.CompareOptions.caseInsensitive, range: replacingRange)
    print(string)
    
    //将指定范围的字符串替换为指定的字符串
    string.replaceSubrange(replacingRange, with: "YYYYYYYYYYYYYYY")
    print(string)
    string = string.replacingCharacters(in: replacingRange, with: "YYYYY")
    print(string)
    
    /*  print
     
     XuBaoAiChiYu_QQ_1045214799
     XuBaoAiChiYu_QQ_1045214799
     XuBaoAiChiYu_QQ_1045214799
     YYYYYYYYYYYYYYY214799
     YYYYY9
     
     */
    
}

//删除字符串
fileprivate func testRemovingSubstrings() {
    var string = "XuBaoAiChiYu_QQ_1045214799"
    print(string)
    //删除指定位置的字符串
    string.remove(at: string.characters.index(string.startIndex, offsetBy: 1))
    print(string)
    
    //根据范围删除字符串
    let range = string.characters.index(string.endIndex, offsetBy: -6)..<string.endIndex
    string.removeSubrange(range)
    print(string)
    
    //删除所有
    string.removeAll()
    string.removeAll(keepingCapacity: true)
    
    /*  print
     
     XuBaoAiChiYu_QQ_1045214799
     XBaoAiChiYu_QQ_1045214799
     XBaoAiChiYu_QQ_1045
     
     */
}

//比较字符串
fileprivate func testComparingStrings() {
    
    var string = "XuBaoAiChiYu_QQ_1045214799"
    let compareStr = "XuBaoAiChiYu_QQ_1045214799"
    let searchRange = string.characters.index(string.startIndex, offsetBy: 5)..<string.characters.index(before: string.endIndex)
    print(searchRange)
    
    //前缀
    var isHas = string.hasPrefix("Xu")
    print("hasPrefix:\(isHas)")
    
    //后缀
    isHas = string.hasSuffix("1045214799")
    print("hasSuffix:\(isHas)")
    
    //全比较是否相同
    isHas = string == compareStr
    print(isHas)
    
    //比较大小
    var result = string.compare(compareStr)
    print(result.hashValue)
    
    //添加比较范围
    result = string.compare(compareStr, options: NSString.CompareOptions.caseInsensitive, range: searchRange, locale: nil)
    print("result:\(result.hashValue)")
    
    // 返回两个字符串相同的前缀
    string = string.commonPrefix(with: compareStr, options: NSString.CompareOptions.caseInsensitive)
    print(string)
    
    /* print
     
     Index(_base: Swift.String.UnicodeScalarView.Index(_position: 5), _countUTF16: 1)..<Index(_base: Swift.String.UnicodeScalarView.Index(_position: 25), _countUTF16: 1)
     hasPrefix:true
     hasSuffix:true
     true
     1
     result:0
     XuBaoAiChiYu_QQ_1045214799
     
     */
    
}

fileprivate func test() {
    //    testTypeAliases() //类型别名
    //    testInitializers() //初始化
    //    testWorkingWithPaths() //文件路径操作
    //    testFile() //文件读写操作
    //    testGettingProperties() //获取字符串的Swift属性
    //    testGettingLength() //获取字符串长度
    //    testChangingCase() //大小写变化
    //    testGettingNumericValues() //字符串转数值
    //    testCombiningStrings() //增加字符串
    //    testDividingStrings() //分割字符串
    //    testFindingStrings() //查找字符串
    //    testReplacingSubstrings() //替换字符串
    //    testRemovingSubstrings() //删除字符串
    //    testComparingStrings() //比较字符串
}

test()

