//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .red
        
        view.addSubview(label)
        self.view = view
        
        
        print("hello print")
        
        //1.常量，变量，变量类型定义
        let name = "jack"
        var height = 20
        var width:Float = 22
        
        //2.字符串拼接
        print(name + String(height))
        let desc = "小明的身高为：\(height)"
        print(desc)
        
        let mulStr = """
         这是一个多行使用的字符串，
         马路的宽度：\(width)
         """
        print(mulStr)
        
        //3.[]创建数组，字典
        //如果类型可以被推断出来，就可以不必显示的声明。如：给变量赋值
        var empty_arr = [String]()
        var empty_dict = [String:Any]()
        
        var array = ["apple", "orange", "banana"]
        array.append("添加一个新元素")
        let dict: [String : Any] = [
            "name":"lilei",
            "height":170,
            "score":66
            ]
        empty_arr.append(contentsOf: array)
        print("数组中的第二个元素是：\(array[1])")
        print("字典中学生的姓名是：\(dict["name"]!)")
        
        
        //4.可选类型
        var fullName: String? = nil;
        var greeting = "Hello"
        
        if let name = fullName {
            //当可选类型fullName有值时，就会被解包，且if判断为真
            let greeting = "\(greeting) 名字为：\(name)"
        } else {
            print("fullName 的值是空的！！此时显示默认值\(fullName ?? "当fullName为真实显示它自己，否则显示后面的默认值")")
        }
        
        //5.switch
        //将支持各种条件判断
        let switchValue = "apple pai"
        switch switchValue {
        case "apple":
            print("这是一个苹果")
        case let x where x.hasPrefix("apple"):
            print("包含apple 前缀的字符串\(x)")
        case "banana","orenge":
            print("苹果，或者 橘子")
        default:
            print("都不是，会走到这里")
        }
        
        
        //6.for循环dict
        let forDict = [
            "beijing":[20,10,33],
            "nanjing":[33,9,22],
            "shanghai":[20]
        ]
        for (city,list) in forDict {
            print("城市名：\(city), 列表：\(list)")
        }
        
        
        //7.while
        var num = 2
        while num < 100 {
            num *= 2
        }
        print(num)
        
        repeat {
            num *= 2
        } while num < 200
        print("至少运行一次\(num)")
        
        //8.范围..<
        for i in 0..<3 {
            print("范围打印:\(i)")
        }
        
        
        //9.函数和闭包
        func greet(person: String, today:String) ->String {
            //1.函数默认使用参数名称作为参数标签
            return "Hello \(person), today is \(today) !!"
        }
        print(greet(person: "Tom", today: "星期二"))
        
        func greet2(_ person:String, on today:String) -> String {
            //2.自定义参数标签，_代表不用参数标签
            return "Hello \(person), today is \(today)"
        }
        print(greet2("lilei", on: "星期二"))
        
        func calculateStatics(scoreList:[Int]) -> (min:Int, max:Int, sum:Int){
            //3.返回元组，元组可以通过下标或者key来获取
            var min = scoreList[0]
            var max = scoreList[0]
            var sum = 0
            
            for score in scoreList {
                if score < min  {
                    min = score
                }
                
                if score > max {
                    max = score
                }
                
                sum += score
            }
            
            return (min, max, sum)
        }
        
        func returnFiveteen() -> Int {
            //4.函数内容定义子函数，用于内容分离
            var num = 10
            
            func add() -> Int {
                return num+5;
            }
            add()
            
            return num
        }
        
        func returnFunc() -> ((Int)->Int) {
            //5.函数是一等类型，即：基本类型，可以做为返回值使用
            func addOne(one: Int) -> Int{
                return one+1
            }
            
            return addOne
        }
        
        func hasMacthConditon(list:[Int], condition:(Int) -> Bool) -> Bool{
            //6.函数作为一等类型，即：基本类型，可以作为参数使用
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        func lessThanTen(condition:Int) -> Bool{
            if condition < 10 {
                return true
            }
            return false
        }
        let list = [20,30,5]
        hasMacthConditon(list: list, condition: lessThanTen)
        
        list.map({ (num: Int) -> Int in
            //7.闭包是一种特殊的函数，通过{}来定义，利用in将参数、返回值声明与函数体分开。可以访问闭包作用域中的内容
            let result = num * 3
            return result
        })
        let list_res1 = list.map({num in 3*num})//闭包简洁写法：如果参数和返回类型已知，可以进行省略，甚至两者可以都省略
        print(list_res1)
        let list_sort = list.sorted{ $0>$1 }//可以使用参数位置替代参数名称，如果闭包简单且只有闭包这一个参数，可以省略()
        print(list_sort)
        
        //10.对象和类
        class Shape {
            //类中的变量，常量，函数和普通的三者区别是上下文不同而已
            //类中的属性需要有初始值，无论是内部预先定义还是使用构造方法传入
            var numberOfSides = 0
            func simpleDescription() -> String {
                return "A Shape has \(numberOfSides) sides"
            }
        }
        let shape = Shape()
        shape.numberOfSides = 4
        print(shape.simpleDescription())
        
        class NameShape {
            //带构造方法
            var numberOfSides: Int = 4
            var name: String
            
            init(_ name:String) {
                self.name = name
            }
            
            func simpleDescription() -> String {
                return "A Shape has \(numberOfSides) sides"
            }
        }
        
        class Square: NameShape {
            var sideLength: Double
            
            init(sideLength: Double, name:String) {
                self.sideLength = sideLength
                super.init(name)
                numberOfSides = 4
            }
            
            func area() -> Double {
                return self.sideLength * Double(numberOfSides)
            }
            //重写父类方法
            override func simpleDescription() -> String {
                return "A quera has four sides, length:\(sideLength)"
            }
        }
        let sq = Square(sideLength: 20, name: "矩形")
        print(sq.simpleDescription())
        
        class EqualSquare: NameShape {
            var sideLength: Double = 0.0
            //构造方法的执行步骤：设置子类属性，调用父类的构造方法，修改父类属性
            init(name: String, sideLength: Double) {
                self.sideLength = sideLength
                super.init(name)
                numberOfSides = 3
            }
            //geter,setter计算属性
            var perimeter: Double {
                get {
                    return sideLength * 3.0
                }
                
                set {
                    sideLength = newValue/3.0
                }
            }
            override func simpleDescription() -> String {
                return "一个三角形有三条边，周长是：\(self.perimeter)"
            }
            
        }
        
        class EqualSquareAndSquare {
            //willSet, didSet在属性发生变化前后调用
            var triangle: EqualSquare {
                willSet {
                    self.square.sideLength = newValue.sideLength;
                }
            }
            
            var square:Square {
                willSet {
                    triangle.sideLength = newValue.sideLength;
                }
            }
            
            init(side: Double, name:String) {
                triangle = EqualSquare(name: "三角形", sideLength: 22)
                square = Square(sideLength: 33, name: "四边形")
            }
            
        }
        
        //11.枚举和结构体
        enum Rank:Int{
            //枚举和类，对象的命名一样，且可以定义方法
            case ace = 1
            case two,three,four,five,six,seven,eight,nine,ten
            case jack,queen,king
            
            func simpleDescription() -> String {
                switch self {
                case .ace:
                    //关联值就是实际值，并不是原始值1的另一种表达
                    return "ace"
                case .two:
                    return "two"
                case .jack:
                    return "jack"
                case .queen:
                    return "queen"
                case .king:
                    return "king"
                    
                default:
                    return String(self.rawValue)
                }
            }
        }
        let ace = Rank.ten
        print(ace.simpleDescription())
        
        if let threeEnum = Rank.init(rawValue: 3) {
            //使用init创建
            print(threeEnum.simpleDescription())
        }
        
        
        enum ServerResponse {
            case result(String, String)
            case failure(String)
        }
        let success = ServerResponse.result("6:00 am", "8:09 pm")
        let failure = ServerResponse.failure("失败了")
        switch success {
        case let .result(sunrise, sunset):
            print("日出时间为：\(sunrise), 日落时间为：\(sunset)")
        case let .failure(message):
            print("请求失败， \(message)")
        default:
            print("其他异常")
        }
        
        struct Card {
            //结构体与类的主要区别是：结构体传值，类传指针
            //结构体的属性在默认构造函数中
            var rank: Rank
            var response: ServerResponse
            
            func simpleDescription() -> String {
                return "Card 的属性值为 rank:\(rank), response: \(response)"
            }
        }
        let card = Card(rank: .five, response: .failure("error"))
        print(card.simpleDescription())
        
    }
    

}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
