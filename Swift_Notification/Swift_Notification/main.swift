//
//  main.swift
//  Swift_Notification
//
//  Created by caoxu on 2017/3/15.
//  Copyright © 2017年 BJWenTianXia. All rights reserved.
//

import Foundation

let notificationName = "notificationName"

/*-------------------------通知-------------------------*/
//class Person: NSObject {
//    
//    override init() {
//        super.init()
//        print("Person_init")
//        NotificationCenter.default.addObserver(self, selector: #selector(Person.notifiTest(_:)), name: NSNotification.Name(rawValue: notificationName), object: nil)
//    }
//    
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationName), object: nil)
//    }
//    
//    func notifiTest(_ notification:Notification) {
//        print("notification:\(notification)")
//    }
//    
//}
//
//class Bank: NSObject {
//    override init() {
//        super.init()
//        print("Bank_init")
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationName), object: nil)
//    }
//}

/*-------------------------通知队列-------------------------*/
class Person: NSObject {
    
    override init() {
        super.init()
        print("Person_init")
        let notification = NSNotification.init(name: NSNotification.Name(rawValue: notificationName), object: nil)
        NotificationQueue.default.enqueue(notification as Notification, postingStyle: .whenIdle, coalesceMask: .onName, forModes: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Person.notifiTest(_:)), name: notification.name, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
    
    func notifiTest(_ notification:Notification) {
        print("notification:\(notification)")
    }
    
}

class Bank: NSObject {
    override init() {
        super.init()
        print("Bank_init")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationName), object: "Bank", userInfo: ["app":"APP"])
    }
}

let person = Person()
let bank = Bank()




