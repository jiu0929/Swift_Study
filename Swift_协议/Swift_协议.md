#Swift_协议

---

[点击查看源码](https://github.com/XuBaoLoveEatFish/Swift_Study)

````
//协议
@objc protocol SomeProtocol:class {
    
    //class代表只用类才能实现这个协议
    func test()
    
    //@objc:OC特性 代表可以使用optional特性 optional可选的方法
    @objc optional func testOptional()
    
}

protocol AnotherProtocol: SomeProtocol {
    
    //协议可继承
    
}

//协议扩展
extension SomeProtocol {
    
    func testExtension() {
        print(#function)
    }
    
}

class SomeClass:NSObject, SomeProtocol {
    
    func test() {
        print(#function)
    }
    
}

/*
 
 test()
 testExtension()
 
 */
````