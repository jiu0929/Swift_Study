#Swift_数组详解

---

###初始化

````
//初始化
fileprivate func testInit() {
    //空数组
    var  array = [Int]()
    print(array)
    array = []
    print(array)
    array = Array<Int>()
    print(array)
    
    //有数值的数组
    array = [Int](repeating: 0, count: 3)
    print(array)
    array = [0, 0, 0]
    print(array)
    
    /* print
     
     []
     []
     []
     [0, 0, 0]
     [0, 0, 0]
     
     */
}
````

###查询相关信息

````
//查询相关信息
fileprivate func testQuerying() {
    var array = ["XuBaoAiChiYu", "QQ", "1045214799"]
    print("contains:\(array.contains("XuBaoAiChiYu"))") //是否存在这个元素
    print("count:\(array.count)")       //有多少个元素
    print("capacity:\(array.capacity)") //有多少个元素
    print("startIndex:\(array.startIndex)") //首坐标
    print("endIndex:\(array.endIndex)")     //尾脚标
    print("first:\(array.first)") //首元素
    print("last:\(array.last)")   //尾元素
    print("isEmpty:\(array.isEmpty)") //是否为空
    
    //获取指定位置的元素
    var temp = (array as NSArray).object(at: 0)
    temp = array[0]
    print("\(temp)")
    
    //获取多个元素
    let nRange : NSRange = NSMakeRange(0, 3)
    let nIndexSet = IndexSet(integersIn: nRange.toRange() ?? 0..<0)
    let ocArray = (array as NSArray).objects(at: nIndexSet)
    print("\(ocArray)")
    
    let range = (0 ..< 3)
    let sArray = array[range]
    print("\(sArray)")
    
    //遍历
    //只获取元素
    for item in array {
        print(item)
    }
    //遍历元素和所处的位置
    for (index, value) in array.enumerated() {
        print("\(index):\(value)")
    }
    
    /*  print
     
     contains:true
     count:3
     capacity:3
     startIndex:0
     endIndex:3
     first:Optional("XuBaoAiChiYu")
     last:Optional("1045214799")
     isEmpty:false
     XuBaoAiChiYu
     [XuBaoAiChiYu, QQ, 1045214799]
     ["XuBaoAiChiYu", "QQ", "1045214799"]
     XuBaoAiChiYu
     QQ
     1045214799
     0:XuBaoAiChiYu
     1:QQ
     2:1045214799
     
     */
}
````

###查找元素位置

````
//查找元素位置
fileprivate func testFindingObjects() {
    
    let array = ["XuBaoAiChiYu", "QQ", "1045214799"]
    
    // 查找元素
    var index = array.index(of: "QQ")
    print(index!)
    
    // closures查找
    index = array.index { (str:String) -> Bool in
        if str == "QQ" {
            return true
        }
        return false
    }
    print(index!)
    
    // 简写
    index = array.index{ str in return str == "QQ" }
    print("index:\(index)")
    index = array.index{ str in str == "QQ" }
    print("index:\(index)")
    index = array.index{ $0 == "QQ"}
    print("index:\(index)")
    
    /* print
     
     1
     1
     index:Optional(1)
     index:Optional(1)
     index:Optional(1)
     
     */
}
````

###增加元素

````
//增加元素
fileprivate func testAdding() {
    
    var array = [String]()
    print(array)
    
    //增加一个
    array.append("XuBaoAiChiYu")
    print(array)
    array += ["XuBaoAiChiYu"]
    print(array)
    
    //增加多个
    array.append(contentsOf: ["QQ", "1045214799"])
    print(array)
    array += ["QQ", "1045214799"]
    print(array)
    
    //插入
    array.insert("1045214799", at: 0)
    print(array)
    //插入多个
    array.insert(contentsOf: ["1045214799", "QQ"], at: 0)
    print(array)
    
    /* print
     
     []
     ["XuBaoAiChiYu"]
     ["XuBaoAiChiYu", "XuBaoAiChiYu"]
     ["XuBaoAiChiYu", "XuBaoAiChiYu", "QQ", "1045214799"]
     ["XuBaoAiChiYu", "XuBaoAiChiYu", "QQ", "1045214799", "QQ", "1045214799"]
     ["1045214799", "XuBaoAiChiYu", "XuBaoAiChiYu", "QQ", "1045214799", "QQ", "1045214799"]
     ["1045214799", "QQ", "1045214799", "XuBaoAiChiYu", "XuBaoAiChiYu", "QQ", "1045214799", "QQ", "1045214799"]
     
     */
}
````

###删除元素

````
//删除元素
fileprivate func testRemoving() {
    var array = ["XuBaoAiChiYu", "QQ", "1045214799"]
    print(array)
    
    array = array + array + array + array
    print(array)
    
    var temp = array.removeFirst() //删除首个元素 并返回删除的元素
    print(array)
    print(temp)
    
    array.removeFirst(2) //删除前两个元素
    print(array)
    
    temp = array.removeLast() //删除最后一个元素
    print(array)
    
    temp = array.remove(at: 0) //删除指定位置的元素
    print(array)
    
    array.removeSubrange((array.indices.suffix(from: 0))) //删除指定范围的元素
    print(array)
    
    array.removeAll() //删除所有元素
    print(array)
    
    /* print
     
     ["XuBaoAiChiYu", "QQ", "1045214799"]
     ["XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799"]
     ["QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799"]
     XuBaoAiChiYu
     ["XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799"]
     ["XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ"]
     ["QQ", "1045214799", "XuBaoAiChiYu", "QQ", "1045214799", "XuBaoAiChiYu", "QQ"]
     []
     []
     
     */
}
````

###替换元素

````
//替换元素
fileprivate func testReplacing() {
    
    var array = ["XuBaoAiChiYu", "QQ", "1045214799"]
    print(array)
    
    array[1] = "iOS" // 替换指定位置的元素
    print(array)
    
    // 替换指定范围的元素
    array[0..<3] = ["a", "b", "c"]
    print(array)
    
    let subRange: CountableRange<Int> = (array.indices.suffix(from: 1))
    array.replaceSubrange(subRange, with: ["c","d","e"])
    print(array)
    
    /*  print
     
     ["XuBaoAiChiYu", "QQ", "1045214799"]
     ["XuBaoAiChiYu", "iOS", "1045214799"]
     ["a", "b", "c"]
     ["a", "c", "d", "e"]
     
     */
    
}
````

###排序

````
//排序
fileprivate func testSorting() {
    var array = ["XuBaoAiChiYu", "QQ", "1045214799"]
    print(array)
    
    array = array.sorted()
    print(array)
    
    //自定义排序
    func backwards(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    array = array.sorted(by: backwards)
    print(array)
    
    //简写
    array = array.sorted(by: { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
    print(array)
    
    array = array.sorted(by: <)
    print(array)
    
    /*  print
     
     ["XuBaoAiChiYu", "QQ", "1045214799"]
     ["1045214799", "QQ", "XuBaoAiChiYu"]
     ["XuBaoAiChiYu", "QQ", "1045214799"]
     ["XuBaoAiChiYu", "QQ", "1045214799"]
     ["1045214799", "QQ", "XuBaoAiChiYu"]
     
     */
}
````

###文件读和写

````
//文件读和写
fileprivate func testReadingAndWriting() {
    
    //Document目录
    let documents:[String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    let docDirPath = documents.first!
    let path = (docDirPath as NSString).appendingPathComponent("test.plist")
    let url = URL(fileURLWithPath: path)
    
    var array = ["XuBaoAiChiYu", "QQ", "1045214799"]
    
    //写
    (array as NSArray).write(toFile: path, atomically: true)
    (array as NSArray).write(to: url, atomically: true)
    
    //读
    array = NSArray(contentsOfFile: path) as! Array
    print(array)
    
    array = NSArray(contentsOf: url) as! Array
    print(array)
    
    /*  print
     
     ["XuBaoAiChiYu", "QQ", "1045214799"]
     ["XuBaoAiChiYu", "QQ", "1045214799"]
     
     */
}
````