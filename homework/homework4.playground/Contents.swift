import UIKit

//Enum
//1
enum Direction: Int {
    case East = 0;
    case South
    case West
    case North
}
func adjacentCity(direction: Direction)->String{
    if(direction == Direction.East){
        return "秦皇岛"
    }
    else if(direction == Direction.South){
        return "济南"
    }
    else if(direction == Direction.West){
        return "大同"
    }
    else{
        return "承德"
    }
}
adjacentCity(direction: Direction.East)

//2
let currentDirection = Direction.North
print(currentDirection.rawValue)

//3
enum Direction_S: String {
    case East
    case South
    case West
    case North
}
print(Direction_S.North.rawValue)

//4
enum OperationFeedback {
    case Done(Int)
    case Fail(String)
}
var balanceOfATM = 10000
func withdrawFromATM(money: Int)->OperationFeedback{
    if(balanceOfATM<money){
        return OperationFeedback.Fail("the bank doesn't have enough money!")
    }
    else{
        balanceOfATM -= money
        return OperationFeedback.Done(balanceOfATM)
    }
}
var getMoney = withdrawFromATM(money: 1288)
switch getMoney{
case .Done(var left):
    print(left)
case .Fail(var error):
    print(error)
}

//Struct and Class
//1
struct Coordinate{
    var x = 0.0
    var y = 0.0
}

//2
struct Line{
    var startPoint = Coordinate()
    var endPoint = Coordinate()
    func length()->Double{
        return sqrt((startPoint.x - endPoint.x)*(startPoint.x - endPoint.x) + (startPoint.y - endPoint.y)*(startPoint.y - endPoint.y))
    }
}

//3
var pointA = Coordinate(x:1,y:2)
var pointB = Coordinate(x:3,y:6)
var lineAB = Line(startPoint:pointA,endPoint:pointB)
lineAB.length()

//4
enum stageOfWashingMachine{
    case ready
    case filling
    case washing
    case drying
    case heating
}
class WashingMachine{
    var brand = ""
    var isOn = false
    var state = stageOfWashingMachine.ready
    func description()->(){
        if(isOn){
            print("The brand is \(brand). It is at \(state) state.")
        }
        else{
            print("The machine is off.")
        }
    }
}
//5
var myWashingMachine = WashingMachine()
myWashingMachine.brand = "Good"
myWashingMachine.description()
myWashingMachine.isOn = true
myWashingMachine.state = stageOfWashingMachine.drying
myWashingMachine.description()
