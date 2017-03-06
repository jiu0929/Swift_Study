#Swift_销毁

---

[点击查看源码](https://github.com/XuBaoLoveEatFish/Swift_Study)

###销毁
````
func test() {
    
    class SomeClass {
        
        //类销毁时 通知此方法
        deinit {
            print("销毁")
        }
        
    }
    
    var sClass:SomeClass? = SomeClass()
    sClass = nil
}
````