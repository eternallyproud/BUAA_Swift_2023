import UIKit
import AVFAudio

class DrawLotsViewController: UIViewController {
    //initialize
    var dicCheck : [Int:UIImageView] = [:]//check(image)
    var dicPlayer : [Int:UIImageView] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        playersNum = players.playerNum;
        dicCheck = [1:check1,2:check2,3:check3,4:check4,5:check5,6:check6,7:check7,8:check8,9:check9,10:check10,11:check11,12:check12]
        dicPlayer = [1:player1,2:player2,3:player3,4:player4,5:player5,6:player6,7:player7,8:player8,9:player9,10:player10,11:player11,12:player12]
        //start game
        startGameButton.isHidden = true
    }
    //process drawlots->wolf->prophet->witch->protector
    var DrawLotsProcess = true
    var GameProcess = false
    var WolfProcess = false
    var ProphetProcess = false
    var ProphetDidMove = false
    var WitchProcess = false
    var WitchDidMove = false
    var DayProcess = false
    var SheriffProcess = false
    var ChangeSheriffProcess = false
    var DiscussProcess = false
    var HuntProcess = false
    //win
    var GoodWin = false
    var WolfWin = false
    //music
    var musicPlayer = MusicPlayer()
    var musicSelected = 1
    let musicNum = 3
    
    //voice
    var speaker  = Speaker()
    var voice = 1
    
    //character(draw lots)
    let playersDic = ["player1":1,"player2":2,"player3":3,
                      "player4":4,"player5":5,"player6":6,
                      "player7":7,"player8":8,"player9":9,
                      "player10":10,"player11":11,"player12":12]
    var players = Players(plyerNum: 12, arrayIdentities: ["平民","平民","平民","平民","狼人","狼人","狼人","狼人","预言家","白痴","猎人","女巫"])
    var playersNum = 0;
    var playerId = 0;
    
    //timer
    var timer = Timer()
    
    //skip
    
    @IBAction func skip(_ sender: UIButton) {
        if(DrawLotsProcess){
            for i in 1...12{
                if(players.checkPlayer(playerId: i)){
                    let indextIdentities = Int.random(in: 0...(players.playerNum-1))
                    let id = players.arrayIdentities[indextIdentities]
                    players.arrayIdentities.remove(at: indextIdentities)
                    players.playerNum -= 1
                    let player = Player(character: id, playerId: i, liveState: true)
                    players.addPlayer(player: player)
                    dicCheck[i]?.image = #imageLiteral(resourceName: "check")
                }
            }
            GameProcess = true
            startGameButton.setTitle("开始游戏", for: UIControl.State.normal)
            startGameButton.tintColor = UIColor.lightGray
            startGameButton.isHidden = false
        }
        if(WolfProcess){
            timer.invalidate()
            speaker.StopSpeaking()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ProphetMove), userInfo: nil, repeats: false)
        }
        if(ProphetProcess){
            timer.invalidate()
            speaker.StopSpeaking()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(WitchMove), userInfo: nil, repeats: false)
        }
        if(WitchProcess){
            timer.invalidate()
            speaker.StopSpeaking()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DayTime), userInfo: nil, repeats: false)
        }
        if(SheriffProcess){//结束警长竞选
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(NightInfo), userInfo: nil, repeats: false)
            SheriffProcess = false
        }
        if(ChangeSheriffProcess){//结束警徽转移
            if(!players.PlayerIsAlive(playerId: players.sheriff)){
                dicPlayer[players.sheriff]!.image = #imageLiteral(resourceName: "player\(players.sheriff)")
                players.sheriff = 0
            }
            ChangeSheriffProcess = false
            if(players.NoDeadLeft() && DayProcess){
                Discuss()
            }
            else if(players.NoDeadLeft() && !DayProcess){
                WolfMove()
            }
            else{
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DeadAct), userInfo: nil, repeats: false)
            }
            if(players.sheriff != 0){//选出警长 不再需要警长竞选
                players.needSheriff = false
            }
        }
        if(HuntProcess){
            HuntProcess = false
        }
        if(DiscussProcess){
            DiscussProcess = false
            if(players.voted != 0){
                players.Vote(players.voted)
                players.AddDead(players.voted)
                PlayerIsDead(players.voted)
                players.voted = 0
                DayProcess = false
                if(!CheckResult()){
                    DeadAct()
                }
            }
            else{
                DayProcess = false
                WolfMove()
            }
        }
    }
    
    @IBAction func playerButton(_ sender: UIButton) {
        playerId = playersDic[sender.titleLabel!.text!]!
        if(DrawLotsProcess){
            self .performSegue(withIdentifier: "random", sender: self)}
        if(WolfProcess){
            if(players.PlayerIsAlive(playerId: playerId)){
                if(players.WhoIsKilled() != 0){
                    dicCheck[players.WhoIsKilled()]!.isHidden = true
                    //clear image
                }
                dicCheck[playerId]!.image = #imageLiteral(resourceName: "抓痕")
                dicCheck[playerId]!.contentMode = UIView.ContentMode.scaleToFill
                dicCheck[playerId]!.isHidden = false
                players.Kill(playerId: playerId)
            }
        }
        if(ProphetProcess && !ProphetDidMove){
            if(players.PlayerIsAlive(playerId: playerId)){
                ProphetDidMove = true
                self.performSegue(withIdentifier: "prophet", sender: self)
            }
        }
        if(WitchProcess && !WitchDidMove){
            let condition = (players.WhoIsKilled() == playerId && players.WitchHasAntidote())
            //this player is killed + witch has antidote + witch is not the one killed
            if(players.PlayerIsAlive(playerId: playerId) && playerId != players.witch){//alive?
                if(condition){
                    players.Save()
                    dicCheck[playerId]?.contentMode = UIView.ContentMode.bottomRight
                    dicCheck[playerId]?.image = #imageLiteral(resourceName: "check")
                    dicCheck[playerId]?.isHidden = false
                    WitchDidMove = true
                }//changeble
                else if(players.WitchHasPoison()){
                    players.Poison(playerId)
                    dicCheck[playerId]?.contentMode = UIView.ContentMode.bottomRight
                    dicCheck[playerId]?.image = #imageLiteral(resourceName: "poisoned")
                    dicCheck[playerId]?.isHidden = false
                    WitchDidMove = true
                }
            }
        }
        if(SheriffProcess || ChangeSheriffProcess){
            if(players.hunted != playerId && players.PlayerIsAlive(playerId: playerId)){
                if(players.sheriff != 0){
                    dicPlayer[players.sheriff]!.image = #imageLiteral(resourceName: "player\(players.sheriff)")
                }
                dicPlayer[playerId]?.image = #imageLiteral(resourceName: "sheriff2")
                players.sheriff = playerId
            }
        }
        if(HuntProcess){
            if(players.PlayerIsAlive(playerId: playerId)){
                dicCheck[playerId]?.image = #imageLiteral(resourceName: "hunted")
                dicCheck[playerId]?.isHidden = false
                dicCheck[playerId]?.contentMode = UIView.ContentMode.scaleAspectFit
                players.Hunt(playerId)
                players.AddDead(playerId)
                HuntProcess = false
            }
        }
        if(DiscussProcess){
            if(players.PlayerIsAlive(playerId: playerId) && (players.CanVote(playerId))){
                if(players.voted != 0){
                    dicCheck[players.voted]!.isHidden = true
                }
                dicCheck[playerId]?.image = #imageLiteral(resourceName: "dead")
                dicCheck[playerId]?.isHidden = false
                dicCheck[playerId]?.contentMode = UIView.ContentMode.bottomRight
                players.voted = playerId
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "random"){
            let destination = segue.destination as! RandomViewController // forced downcast
            destination.players = players;
            destination.playerId = playerId
            destination.sourceView = self
        }
        if (segue.identifier == "prophet"){
            let destination = segue.destination as! ProphecyViewController
            destination.player = players.playersArray[playerId]
        }
        if (segue.identifier == "music"){
            let destination = segue.destination as! MusicViewController
            destination.musicPlayer = self.musicPlayer
        }
    }
    @IBOutlet weak var check1: UIImageView!
    @IBOutlet weak var check2: UIImageView!
    @IBOutlet weak var check3: UIImageView!
    @IBOutlet weak var check4: UIImageView!
    @IBOutlet weak var check5: UIImageView!
    @IBOutlet weak var check6: UIImageView!
    @IBOutlet weak var check7: UIImageView!
    @IBOutlet weak var check8: UIImageView!
    @IBOutlet weak var check9: UIImageView!
    @IBOutlet weak var check10: UIImageView!
    @IBOutlet weak var check11: UIImageView!
    @IBOutlet weak var check12: UIImageView!
    
    @IBOutlet weak var player1: UIImageView!
    @IBOutlet weak var player2: UIImageView!
    @IBOutlet weak var player3: UIImageView!
    @IBOutlet weak var player4: UIImageView!
    @IBOutlet weak var player5: UIImageView!
    @IBOutlet weak var player6: UIImageView!
    @IBOutlet weak var player7: UIImageView!
    @IBOutlet weak var player8: UIImageView!
    @IBOutlet weak var player9: UIImageView!
    @IBOutlet weak var player10: UIImageView!
    @IBOutlet weak var player11: UIImageView!
    @IBOutlet weak var player12: UIImageView!
    
    //start game
    @IBOutlet weak var startGameButton: UIButton!
    @IBAction func startGame(_ sender: UIButton) {
        if ((GameProcess && DrawLotsProcess)){//(GameWolfProcess && DrawLotsProcess){
            DrawLotsProcess = false
            startGameButton.isHidden = true
            for i in 1...12{
                dicCheck[i]!.isHidden = true
            }
            speaker.Speak(part: 0, speaker: voice)
            //wolf?
            timer = Timer.scheduledTimer(timeInterval: 7, target: self, selector: #selector(WolfMove), userInfo: nil, repeats: false)
        }
    }
    @objc func WolfMove() {
        timer.invalidate()
        WolfProcess = true
        speaker.Speak(part: 1, speaker: voice)
        timer = Timer.scheduledTimer(timeInterval: 43, target: self, selector: #selector(ProphetMove), userInfo: nil, repeats: false)
    }
    @objc func ProphetMove() {
        if(players.WhoIsKilled() != 0){
            dicCheck[players.WhoIsKilled()]!.isHidden = true
        }
        timer.invalidate()
        WolfProcess = false
        ProphetProcess = true
        ProphetDidMove = false
        speaker.Speak(part: 11, speaker: voice)
        timer = Timer.scheduledTimer(timeInterval: 33, target: self, selector: #selector(WitchMove), userInfo: nil, repeats: false)
    }
    @objc func WitchMove() {
        timer.invalidate()
        ProphetProcess = false
        ProphetDidMove = false
        WitchProcess = true
        WitchDidMove = false
        speaker.Speak(part: 12, speaker: voice)
        if(players.WhoIsKilled() != 0 && players.WitchHasPoison()){
            dicCheck[players.WhoIsKilled()]!.image = #imageLiteral(resourceName: "抓痕")
            dicCheck[players.WhoIsKilled()]!.contentMode = UIView.ContentMode.scaleAspectFit
            dicCheck[players.WhoIsKilled()]!.isHidden = false
        }
        timer = Timer.scheduledTimer(timeInterval: 28, target: self, selector: #selector(DayTime), userInfo: nil, repeats: false)
    }
    
    //day time
    @objc func DayTime(){
        timer.invalidate()
        WitchProcess = false
        WitchDidMove = false
        DayProcess = true
        speaker.Speak(part: 21, speaker: voice)
        if(players.WhoIsKilled() != 0){
            dicCheck[players.WhoIsKilled()]?.isHidden = true
        }
        if(players.poisoned != 0){
            dicCheck[players.WhoIsPoisoned()]?.isHidden = true
        }
        if(players.needSheriff){
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(VoteSheriff), userInfo: nil, repeats: false)
        }
        else{
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(NightInfo), userInfo: nil, repeats: false)
        }
    }
    @objc func VoteSheriff(){//警长竞选
        timer.invalidate()
        SheriffProcess = true
        speaker.Speak(part: 22, speaker: voice)
    }
    @objc func ChangeSheriff(){//警长移交警徽
        timer.invalidate()
        ChangeSheriffProcess = true
        speaker.Speak(part: 28, speaker: voice)
    }
    @objc func NightInfo(){//死亡信息
        timer.invalidate()
        if((players.WhoIsKilled() != 0 && !players.saved) || (players.poisoned != 0)){
            speaker.Speak(part: 23, speaker: voice)
            if(players.WhoIsKilled() != 0 && !players.saved){
                PlayerIsDead(players.killed)
                players.AddDead(players.killed)
            }
            if(players.poisoned != 0){
                PlayerIsDead(players.poisoned)
                players.AddDead(players.poisoned)
            }
        }
        else{
            speaker.Speak(part: 24, speaker: voice)
        }
        players.saved = false
        players.killed = 0
        players.poisoned = 0
        if(!CheckResult()){
            if(players.NoDeadLeft()){
                timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(Discuss), userInfo: nil, repeats: false)
            }
            else{
                timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(DeadAct), userInfo: nil, repeats: false)
            }
        }
    }
    @objc func DeadAct(){//请 发动技能
        if(players.hunted != 0){
            PlayerIsDead(players.hunted)
            players.hunted = 0
        }
        if(!CheckResult()){
            playerId = players.GetDead()
            speaker.Speak(part: 100 + playerId, speaker: voice)
            if(players.CanHunt(playerId)){
                HuntProcess = true
            }
            if(playerId == players.sheriff){
                timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(ChangeSheriff), userInfo: nil, repeats: false)
            }
            else{
                timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(NotSheriff), userInfo: nil, repeats: false)
            }
        }
    }
    @objc func NotSheriff(){
        if(players.NoDeadLeft()){
            if(DayProcess){
                Discuss()
            }
            else{
                WolfMove()
            }
        }
        else{
            DeadAct()
        }
    }
    @objc func Discuss(){//放逐投票
        DiscussProcess = true
        if(players.sheriff != 0){
            speaker.Speak(part: 25, speaker: voice)
        }
        else{
            let select = Int.random(in: 26...27)
            speaker.Speak(part: select, speaker: voice)
        }
    }
    
    func PlayerIsDead(_ playerId : Int){
        //unreversable!!!
        if(players.CanTurn(playerId)){
            dicPlayer[playerId]?.image = #imageLiteral(resourceName: "白痴")
            dicCheck[playerId]!.isHidden = true
            players.turned = true
        }
        else{
            dicCheck[playerId]!.isHidden = false
            dicCheck[playerId]!.contentMode = UIView.ContentMode.scaleAspectFit
            dicCheck[playerId]!.image = #imageLiteral(resourceName: "dead")
            players.PlayerIsDead(playerId)
        }
        WolfWin = players.WolfWin()
        GoodWin = players.GoodWin()
    }
    
    func CheckResult() -> Bool{
        if(GoodWin){
            speaker.StopSpeaking()
            speaker.Speak(part: 29, speaker: voice)
        }
        if(WolfWin){
            speaker.StopSpeaking()
            speaker.Speak(part: 30, speaker: voice)
        }
        return GoodWin || WolfWin
    }
    //background music
    
    @IBAction func JumpToMusic(_ sender: UIButton) {
        performSegue(withIdentifier: "music", sender: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        speaker.StopSpeaking()
        timer.invalidate()
    }
}
