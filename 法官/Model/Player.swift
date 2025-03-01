import Foundation
class Player {
    let character : String
    let playerId : Int
    var liveState : Bool
    var properties : Properties
    init(character: String, playerId: Int, liveState: Bool) {
        self.character = character
        self.playerId = playerId//1~12
        self.liveState = liveState
        properties = Properties(character: character)
    }
    func PlayerIsWolf() -> Bool{
        return (character == "狼人"||character == "狼王"||character == "白狼王"||character == "狼美人")
    }
    func playerIsGod() -> Bool{
        return (character == "女巫"||character == "猎人"||character == "守卫"||character == "预言家"||character == "白痴")
    }
    func witchHasAntidote() -> Bool{
        return (properties.antidote != 0)
    }
    func WitchUseAntidote() {
        properties.antidote = properties.antidote - 1;
    }
    func witchHasPoison() -> Bool{
        return (properties.poison != 0)
    }
    func WitchUsePoison() {
        properties.poison = properties.poison - 1;
    }
    func Poisoned(){
        properties.poisoned = true
    }
    func IsPoisoned() -> Bool{
        return properties.poisoned
    }
    func Voted(){
        properties.voted = true
    }
    func IsVoted() -> Bool{
        return properties.voted
    }
}
