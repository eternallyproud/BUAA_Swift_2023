import Foundation
class Players{
    var playersArray : [Player?]
    var playerNum : Int
    var arrayIdentities : [String]
    let dicIdentities =
    ["平民":"无特殊技能。",
     "狼人":"每晚可以选中一名玩家出局",
     "预言家":"每晚可以查验一个玩家的身份，看对方是好人还是狼人。",
     "白痴":"被放逐时翻牌公开自己的身份，以免除这次放逐的效果。技能发动后本剧游戏不能参与放逐投票，也不能被投票。",
     "猎人":"出局后可以选择对一名玩家猎捕，使其一并出局。",
     "守卫":"每晚可以守护一个玩家，防止其被狼人选中夜间出局。两晚不能连续守护相投的目标。",
     "女巫":"拥有一瓶解药与一瓶毒药，每晚可以选择救活一名被狼人选中夜间出局的玩家，或使用毒药使一名玩家夜间出局。"]
    var killed  = 0
    var poisoned = 0
    var hunted = 0
    var voted = 0
    var saved = false
    var witch = 0
    var needSheriff = true
    var sheriff = 0
    var turned = false
    var playerKilled = [0,0,0,0]
    var godCount = 4
    var wolfCount = 4
    var menCount = 4
    init(plyerNum: Int, arrayIdentities: [String]) {
        self.playersArray = Array(repeating: nil, count: 13)
        self.playerNum = plyerNum
        self.arrayIdentities = arrayIdentities
    }
    func addPlayer(player : Player){
        playersArray[player.playerId] = player
        if(player.character == "女巫"){
            witch = player.playerId
        }
    }
    func checkPlayer(playerId : Int) ->Bool{
        return (playersArray[playerId] == nil)
    }
    func getPlayerCharachter(playerId : Int) ->String{
        return playersArray[playerId]!.character
    }
    func PlayerIsAlive(playerId : Int) ->Bool{
        return playersArray[playerId]!.liveState
    }
    func WhoIsKilled() ->Int{
        return killed
    }
    func Kill(playerId : Int){
        killed = playerId
    }
    func Save() {
        saved = true
        playersArray[witch]!.WitchUseAntidote()
    }
    func Poison(_ playerId : Int) {
        poisoned = playerId
        playersArray[witch]!.WitchUsePoison()
        playersArray[poisoned]!.Poisoned()
    }
    func CanHunt(_ playerId : Int) -> Bool{//猎人发动技能
        return (playersArray[playerId]!.character == "猎人") && (!playersArray[playerId]!.IsPoisoned())
    }
    func Hunt(_ playerId : Int){
        hunted = playerId
    }
    func CanTurn(_ playerId : Int) -> Bool{//白痴发动技能
        return(playersArray[playerId]!.character == "白痴") && (playersArray[playerId]!.IsVoted()) && (!turned)
    }
    func CanVote(_ playerId : Int) -> Bool{
        return !(turned && playersArray[playerId]?.character == "白痴")
    }
    func GetPlayer(_ playerId : Int) ->Player{
        return playersArray[playerId]!
    }
    func WitchHasAntidote() -> Bool{
        return playersArray[witch]!.witchHasAntidote()
    }
    func WitchHasPoison() -> Bool{
        return playersArray[witch]!.witchHasPoison()
    }
    func WhoIsPoisoned() -> Int{
        return poisoned
    }
    func PlayerIsDead(_ playerId : Int){
        let player = playersArray[playerId]!
        player.liveState = false
        if(player.PlayerIsWolf()){
            wolfCount -= 1
        }
        else if(player.playerIsGod()){
            godCount -= 1
        }
        else{
            menCount -= 1
        }
    }
    func AddDead(_ playerId : Int){
        for i in 0...3{
            if(playerKilled[i] == 0){
                playerKilled[i] = playerId
                break
            }
        }
    }
    func GetDead() -> Int{
        let playerId = playerKilled[0]
        for i in 0...2{
            playerKilled[i] = playerKilled[i+1]
        }
        playerKilled[3] = 0
        return playerId
    }
    func NoDeadLeft() -> Bool{
        return playerKilled[0] == 0
    }
    func Vote(_ playerId : Int){
        playersArray[playerId]?.Voted()
    }
    func WolfWin() -> Bool{
        return godCount == 0 || menCount == 0
    }
    func GoodWin() -> Bool{
        return wolfCount == 0
    }
}
