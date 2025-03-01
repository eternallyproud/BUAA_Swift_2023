import Foundation
import AVFAudio
class MusicPlayer{
    var musicPlayer : AVAudioPlayer?
    let musicNum = 7
    var musicSelected = 0
    var soundValue : Float = 0.2
    let musicName : [String] = ["The X-Files","Burial Ground","The Truth Surfaced","Sinner","Scallop Pond","Never Forgive Me, Never Forget Me","Main Titles"]
    func play(){
        if(musicPlayer == nil){
            let url = Bundle.main.url(forResource: musicName[musicSelected], withExtension: "flac")
            musicPlayer = try! AVAudioPlayer(contentsOf: url!)
            musicPlayer!.play()
            musicPlayer!.volume = soundValue
        }
        else if (musicPlayer!.isPlaying){
            musicPlayer!.pause()
        }
        else{
            musicPlayer!.play()
        }
    }
    func pause(){
        if(musicPlayer != nil){
            musicPlayer!.pause()
        }
    }
    func stop(){
        if(musicPlayer != nil){
            musicPlayer!.stop()
            musicPlayer = nil
        }
    }
    func next(){
        musicSelected += 1
        if(musicSelected == musicNum){
            musicSelected = 0
        }
        self.stop()
    }
    func last(){
        musicSelected -= 1
        if(musicSelected == -1){
            musicSelected = musicNum - 1
        }
        self.stop()
    }
    func select(_ musicName : String){
        let NameDic = ["The X-Files":0,"Burial Ground":1,"The Truth Surfaced":2,"Sinner":3,"Scallop Pond":4,"Never Forgive Me, Never Forget Me":5,"Main Titles":6]
        musicSelected = NameDic[musicName]!
        self.stop()
        self.play()
    }
    func setSound(_ SoundValue : Float){
        soundValue = SoundValue
        if(musicPlayer != nil){
            musicPlayer!.volume = SoundValue
        }
    }
    func isPlaying() ->Bool{
        if(musicPlayer == nil){
            return false
        }
        else{
            return musicPlayer!.isPlaying
        }
    }
}
