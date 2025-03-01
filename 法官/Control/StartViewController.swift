//
//  StartViewController.swift
//  法官
//
//  Created by 🐴的 on 2023/11/18.
//

import UIKit

class StartViewController: UIViewController {
    var musicPlayer : MusicPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        musicPlayer = MusicPlayer()
        JudgeLabel.text = ""
        JudgeLabel.isHidden = true
        StartLabel.isHidden = true
        CheckQuestionLabel.isHidden = true
        CheckMusicLabel.isHidden = true
        CheckCharacters.isHidden = true
        let deltTime = 0.1
        let baseTime = 0.5
        Timer.scheduledTimer(withTimeInterval: baseTime, repeats: false){
            (timer) in self.JudgeLabel.text! = " Judge App ";self.JudgeLabel.isHidden = false
        }
        for i in 1...4{
            if(i == 1){
                Timer.scheduledTimer(withTimeInterval: baseTime + deltTime * Double(i), repeats: false){
                    (timer) in self.StartLabel.isHidden = false
                }
            }
            if(i == 2){
                Timer.scheduledTimer(withTimeInterval: baseTime + deltTime * Double(i), repeats: false){
                    (timer) in self.CheckQuestionLabel.isHidden = false
                }
            }
            if(i == 3){
                Timer.scheduledTimer(withTimeInterval: baseTime + deltTime * Double(i), repeats: false){
                    (timer) in self.CheckMusicLabel.isHidden = false
                }
            }
            if(i == 4){
                Timer.scheduledTimer(withTimeInterval: baseTime + deltTime * Double(i), repeats: false){
                    (timer) in self.CheckCharacters.isHidden = false
                }
            }
        }
    }
    //show up one by one
    @IBOutlet weak var JudgeLabel: CLTypingLabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var CheckQuestionLabel: UILabel!
    @IBOutlet weak var CheckMusicLabel: UILabel!
    @IBOutlet weak var CheckCharacters: UILabel!
    
    
    @IBAction func answer(_ sender: UIButton) {
        self.performSegue(withIdentifier: "rookie", sender: self)
    }
    @IBAction func game(_ sender: UIButton) {
        self.performSegue(withIdentifier: "game", sender: self)
    }
    @IBAction func music(_ sender: UIButton) {
        self.performSegue(withIdentifier: "music", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "music"){
            let destination = segue.destination as! MusicViewController
            destination.musicPlayer = self.musicPlayer
        }
        if (segue.identifier == "game"){
            let destination = segue.destination as! MainViewController
            destination.musicPlayer = self.musicPlayer
        }
    }
    

}
