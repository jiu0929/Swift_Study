#Swift_方法

---

[点击查看源码](https://github.com/XuBaoLoveEatFish/Swift_Study)

````
///方法
class Methods: NSObject {
    
    func test() {
//        self.testInstanceMethods() //实例方法
        self.testTypeMethods()     //类型方法
    }
    
    //实例方法
    func testInstanceMethods() {
        self.testLocalAndExternalParameterNames()
        self.testSelfProperty()
        self.testModifyingValueTypesFromWithinInstanceMethods()
        self.testAssigningToSelfWithinMutatingMethod()
    }
    
    //内部和外部属性
    func testLocalAndExternalParameterNames() {
        class Counter {
            var count: Int = 0
            func incrementBy(_ amount: Int, numberOfTimes: Int) {
                count += amount * numberOfTimes
            }
        }
        let counter = Counter()
        counter.incrementBy(5, numberOfTimes: 3)
        print("\(counter.count)")
        
        /*  print
         
         15
         
         */
    }
    
    //self属性
    func testSelfProperty() {
        //self属性
        struct Point {
            var x = 0.0, y = 0.0
            func isToTheRightOfX(_ x: Double) -> Bool {
                //这里有内部和外部属性
                return self.x > x
            }
        }
        let somePoint = Point(x: 4.0, y: 5.0)
        print("\(somePoint.isToTheRightOfX(1.0))")
        
        /*
         
         true
         
         */
    }
    
    //在实例方法中修改值类型
    func testModifyingValueTypesFromWithinInstanceMethods() {
        //因为结构体是值对象，其内部方法无法修改外部值，为了让结构体支持修改结构体内的属性。
        //方法体前加mutating,让结构体的实例方法可以修改结构体中的值
        struct Point {
            var x = 0.0, y = 0.0
            mutating func moveByX(_ deltaX: Double, y deltaY: Double) {
                x += deltaX
                y += deltaY
            }
        }
        var somePoint = Point(x: 1.0, y: 1.0)
        somePoint.moveByX(2.0, y: 3.0)
        print("(\(somePoint.x), \(somePoint.y))")
        
        let fixedPoint = Point(x: 3.0, y: 3.0)
        print(fixedPoint)
        // 结构体是值对象，使用let常量后，无法修改内部值
//        fixedPoint.moveByX(2.0, y: 3.0) // 抛错
        
        /*  print
         
         (3.0, 4.0)
         (Point #1)(x: 3.0, y: 3.0)
         
         */
    }
    
    //自我变异
    func testAssigningToSelfWithinMutatingMethod() {
        //mutating还可以修改当前结构体和当前枚举
        //结构体测试
        struct Point {
            var x = 0.0, y = 0.0
            mutating func moveByX(_ deltaX: Double, y deltaY: Double) {
                self = Point(x: x + deltaX, y: y + deltaY)
            }
        }
        var point = Point()
        point.moveByX(1.0, y: 1.0)
        print(point)
        
        //枚举测试
        enum TriStateSwitch {
            case off, low, high
            mutating func next() {
                switch self {
                case TriStateSwitch.off:
                    self = TriStateSwitch.low
                    print(self)
                case TriStateSwitch.low:
                    self = TriStateSwitch.high
                    print(self)
                case TriStateSwitch.high:
                    self = TriStateSwitch.off
                    print(self)
                }
            }
        }
        var ovenLight = TriStateSwitch.low
        
        ovenLight.next()
        ovenLight.next()
        
        /*
         
         (Point #1)(x: 1.0, y: 1.0)
         high
         off
         
         */
    }
    
    
    //类型方法
    func testTypeMethods() {
        //类
        class SomeClass {
            class func someTypeMethod() {
                // type method implementation goes here
            }
        }
        SomeClass.someTypeMethod()
        
        // 结构体
        struct LevelTracker {
            // static修改属性，方法体要修改static属性，方法前要使用static
            static var highestUnlockedLevel = 1
            static func levelIsUnlocked(_ level: Int) -> Bool {
                return level <= highestUnlockedLevel
            }
        }
        print("\(LevelTracker.levelIsUnlocked(2))")
        /*
         
         false
         
         */
    }
}
````