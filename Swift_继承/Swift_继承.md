#Swift_继承

---
[点击查看源码](https://github.com/XuBaoLoveEatFish/Swift_Study)

````
func testInheritance() {
    
    //基类
    class Base {
        var count = 0.0
        var description: String {
            return "count:\(count)"
        }
        
        //可继承
        func inherited() {
            
        }
        
        //防止继承
        final func preventing() {
            //如果不想子类继承 可在类 属性或方法前添加final
        }
    }
    
    
    //子类
    class Subclass: Base {
        
        //继承的属性和方法前都有override
        override var count:Double {
            didSet {
                print("\(#function)")
            }
        }
        
        override var description: String {
            return "\(#function)" + super.description
        }
        
        override func inherited() {
            print("\(#function)")
        }
    }
    
    let subclass = Subclass()
    
    subclass.count = 10
    print("\(subclass.description)")
    subclass.inherited()
    
    /*  print
     
     count
     descriptioncount:10.0
     inherited()
     
     */
}
````