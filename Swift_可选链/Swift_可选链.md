#Swift_可选链

---

[点击查看源码](https://github.com/XuBaoLoveEatFish/Swift_Study)

````
//可选链
func test() {
    class Person {
        //可选属性可能为nil或Residence类
        var residence: Residence?
    }
    
    class Residence {
        var numberOfRooms = 1
    }
    
    let john = Person()
    john.residence = Residence()
    
    //可选获得
    var roomCount = john.residence?.numberOfRooms
    
    print(roomCount)
    
    //强制获得
    roomCount = john.residence!.numberOfRooms
    
    print(roomCount)
    
    // if获得
    if let roomCount = john.residence?.numberOfRooms {
        print(roomCount)
    }
    
    /*  print
     
     Optional(1)
     Optional(1)
     1
     
     */
}
````