import UIKit

//Properties
//1
struct Circle{
    let pi = 3.1415926
    var area : Double{
        get{
            return radius*radius*pi
        }
        set{
            self.radius = sqrt(newValue/pi)//newValue即为给area赋的值（area本身不储值）
        }
    }
    var radius = 0.0
}
var smallCircle = Circle()
smallCircle.radius = 6
print(smallCircle.area)
var bigCircle = Circle()
bigCircle.area = 10000
print(bigCircle.radius)

//2
struct Car{
    var brand = ""
    var owner : String = ""{
        willSet(newOwner){
            print("The owner will be changed from \(owner) to \(newOwner).")
        }
        didSet{
            print("The old owner is \(oldValue), and the new owner is \(owner).")
        }
    }
    var license = ""
}
var myCar = Car(brand: "Audi", owner: "Mike", license: "100080")
myCar.owner = "Michael"

//3
struct GamePlayer{
    static var highestScore = 0
    var playerName = ""
    var playerId = 0
    var state = 0
    var preScore = 0
    var totalScore : Int{
        get {
            var pastScore = 0;
            switch(state){
            case 2:
                pastScore = 1000
            case 3:
                pastScore = 10000
            case 4:
                pastScore = 20000
            case 5:
                pastScore = 30000
            default:
                pastScore = 0
            }
            return pastScore + preScore
        }
    }
}
var player1 = GamePlayer(playerName: "Tom", playerId: 1000, state: 2, preScore: 876)
print(player1.totalScore)
if(GamePlayer.highestScore < player1.totalScore){
    GamePlayer.highestScore = player1.totalScore;
}
var player2 = GamePlayer(playerName: "Jerry", playerId: 1001, state: 5, preScore: 6690)
if(GamePlayer.highestScore < player2.totalScore){
    GamePlayer.highestScore = player2.totalScore;
}
print(player2.totalScore)
print(GamePlayer.highestScore)

//Methods
//1
//球员名字、投中 2 分球次数、3 分球次数以及总得分。
struct Player{
    var name = ""
    var threePoint = 0
    var twoPoint = 0
    var score : Int{
        get{
            return threePoint * 3 + twoPoint * 2
        }
    }
    mutating func throwBall(point :Int){
        switch(point){
        case 2:
            twoPoint += 1
        case 3:
            threePoint += 1
        default:
            print("Error")
        }
    }
    func printInfo(){
        print("\(name) has thrown \(twoPoint) times twopoints and \(threePoint) times threepoints, so he has \(score) points.")
    }
}

//2
struct Team{
    var name = ""
    var teamates : [Player] = []
    var score :Int{
        get{
            var sum = 0
            for player in teamates{
                sum += player.score
            }
            return sum
        }
    }
    mutating func Teamname(name : String){
        self.name = name
    }
    mutating func addMember(mem:Player){
        teamates.append(mem)
    }
    subscript(index : Int)->Player{
        get{
            return teamates[index]
        }
        set{
            teamates[index] = newValue
        }
    }
}

//3
var bplayer1 = Player(name:"Tom",threePoint: 3, twoPoint: 10)
var bplayer2 = Player(name:"Dean",threePoint: 0, twoPoint: 14)
var bplayer3 = Player(name:"Harry",threePoint: 6, twoPoint: 6)
var team = Team()
team.Teamname(name: "HP")
team.addMember(mem: bplayer1)
team.addMember(mem: bplayer2)
team.addMember(mem: bplayer2)
print("Team \(team.name) has \(team.score) points.")
print("Member \(bplayer1.name) has \(bplayer1.score) points.")
print("Member \(bplayer2.name) has \(bplayer2.score) points.")
print("Member \(bplayer3.name) has \(bplayer3.score) points.")

//4
struct ToolSet{
    static func texPayment(salary : Float)->Float{
        if(salary < 3000){
            return salary * 0.03
        }
        if(salary < 12000){
            return 3000 * 0.03 + (salary - 3000) * 0.1
        }
        if(salary < 25000){
            return 3000 * 0.03 + 9000 * 0.1 + (salary - 12000) * 0.2
        }
        return 3000 * 0.03 + 9000 * 0.1 + 13000 * 0.2 + (salary - 25000) * 0.3
    }
}
print(ToolSet.texPayment(salary: 25000))

//5
bplayer1.throwBall(point: 2)
bplayer2.throwBall(point: 4)
bplayer3.throwBall(point: 3)
bplayer3.printInfo()

//6
var newteam = Team()
newteam.Teamname(name: "BEST")
newteam.addMember(mem: bplayer1)
newteam[0] = bplayer2//如果不add 内存没有分配空间（struct是值类型）
print(newteam[0])
