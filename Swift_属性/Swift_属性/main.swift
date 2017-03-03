//
//  main.swift
//  Swift_属性
//
//  Created by caoxu on 2017/3/3.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

class DataImporter {
    
    var fileName = "data.txt"
    
    init() {
        print("初始化")
    }
}

private class Users {
    
    //有默认值的属性
    var id = 0
    //只指定类型的属性 有可能存储nil
    var name:String?
    //懒加载 只是使用的时候才会初始化
    lazy var importer = DataImporter()
    //get set
    var qqTemp:String = ""
    var qq:String {
        //如果使用get和set则不能使用当前属性名赋值,以免死循环
        //获得
        get {
            print("获得")
            return self.qqTemp
        }
        //设置
        set {
            print("传入值:\(newValue)")
            self.qqTemp = newValue
        }
    }
    //只读 read-only
    var height: Int {
        return 180
    }
    //属性观察
    var address:String = "" {
        willSet {
            print("新地址：\(newValue)")
        }
        didSet {
            print("旧地址：\(oldValue)")
        }
    }
    
    //静态变量
    static var storedTypeProperty = "Some value."
}

//属性
class Properties: NSObject {
    
    func test() {
        self.testProperties()
    }
    
    func testProperties() {
        let user = Users()
        
        //有初始值
        print("\(user.id)")
        
        //无初始值
        print("\(user.name)")
        
        //懒加载 只有使用的时候才会加载
        print("\(user.importer.fileName)") //先输出"初始化" 后输出"data.txt"
        
        //get和set
        user.qq = "1045214799"
        print("\(user.qq)")
        
        //只读
        //   user.height = 150 //报错
        print("\(user.height)")
        
        //属性观察 willSet将设置 didSet已设置
        user.address = "北京"   //新地址：北京  旧地址：
        user.address = "天安门" //新地址：天安门 旧地址：北京
        
        //静态变量
        Users.storedTypeProperty = "static"
        print("\(Users.storedTypeProperty)")
    }
    /*  print
     
     0
     nil
     初始化
     data.txt
     传入值:1045214799
     获得
     1045214799
     180
     新地址：北京
     旧地址：
     新地址：天安门
     旧地址：北京
     static
     
     */
}

let properties = Properties()
properties.test()

