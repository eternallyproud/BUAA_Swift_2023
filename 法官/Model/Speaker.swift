import UIKit
import AVFAudio

class Speaker: NSObject{
    var voicePlayer : AVAudioPlayer!
    func StopSpeaking(){
        if(voicePlayer != nil){
            voicePlayer.stop()
        }
    }
    //0:start
    //1-10: wolf move
    //11-20: god move
    //21-...: else
    //101-112: PlayerWhoIsDeadAct
    
    func Speak(part:Int,speaker:Int){
        switch(part){
        case 0://1s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "TurnToNight", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 1://40s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "WolfMoveNormal", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 2://44s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "WolfMoveKing", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 3://44s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "WolfMoveWhiteKing", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 11://30s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "ProphetMove1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "ProphetMove2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 12://25s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "WitchMove1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "WitchMove2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 21://25s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "DayTime", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 22://25s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "VoteSheriff", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 23://25s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "UnsafeNight", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 24://25s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "SafeNight", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 25://25s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "DeadSheriff", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 26://25s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "DeadLeft", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 27://25s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "DeadRight", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 28://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "ChangeSheriff1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "ChangeSheriff2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 29://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "GoodWin1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "GoodWin2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 30://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "WolfWin1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "WolfWin2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 101://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player1Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player1Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 102://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player2Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player2Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 103://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player3Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player3Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 104://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player4Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player4Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 105://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player5Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player5Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 106://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player6Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player6Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 107://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player7Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player7Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 108://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player8Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player8Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 109://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player9Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player9Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 110://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player10Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player10Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 111://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player11Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player11Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        case 112://2s
            switch(speaker){
            case 1:
                let url = Bundle.main.url(forResource: "Player12Act1", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            case 2:
                let url = Bundle.main.url(forResource: "Player12Act2", withExtension: "mp3")
                voicePlayer = try! AVAudioPlayer(contentsOf: url!)
                voicePlayer.play()
            default: break
            }
        default: break
        }
    }
}
