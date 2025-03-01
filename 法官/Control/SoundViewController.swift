//
//  SoundViewController.swift
//  法官
//
//  Created by 🐴的 on 2023/12/16.
//

import UIKit

class SoundViewController: UIViewController {
    
    var musicPlayer : MusicPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SoundValue.value = musicPlayer.soundValue
        setValue()
    }
    
    @IBOutlet weak var SoundValue: UISlider!
    @IBAction func ChangeSound(_ sender: UISlider) {
        musicPlayer.setSound(SoundValue.value)
        setValue()
    }
    
    @IBOutlet weak var Sound: UILabel!
    @IBOutlet weak var SoundImage: UIImageView!
   
    func setValue(){
        Sound.text = "\(Int(SoundValue.value * 100))%"
        if(musicPlayer.soundValue == 0){
            SoundImage.image = UIImage(systemName: "speaker")
        }
        else if(musicPlayer.soundValue < 0.33){
            SoundImage.image = UIImage(systemName: "speaker.wave.1")
        }
        else if(musicPlayer.soundValue < 0.66){
            SoundImage.image = UIImage(systemName: "speaker.wave.2")
        }
        else{
            SoundImage.image = UIImage(systemName: "speaker.wave.3")
        }
    }
}
