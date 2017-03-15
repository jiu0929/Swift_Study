//
//  Person.swift
//  Swift_KVO
//
//  Created by caoxu on 2017/3/15.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Cocoa

private var context = "person_money_observe"

class Person: NSObject {
    
    let bank = Bank()
    
    override init() {
        super.init()
        // 添加监听
        bank.addObserver(self, forKeyPath: "money", options: NSKeyValueObservingOptions.init(rawValue: 3), context: &context)
        
    }
    // 当被监听的对象改变时 调用该方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("NewKey:\(change![NSKeyValueChangeKey.newKey]!)")
        print("OldKey:\(change![NSKeyValueChangeKey.oldKey]!)")
        print("\n")
    }
    
    deinit {
        // 销毁监听 避免内存泄漏
        bank.removeObserver(self, forKeyPath: "money", context: &context)
    }
    
    open func changeMoneyOfBank(_ money:Float) {
        bank.money = money;
    }
}
