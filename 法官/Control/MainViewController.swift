//
//  MainViewController.swift
//  法官
//
//  Created by 🐴的 on 2023/11/17.
//

import UIKit

class MainViewController: UIViewController {
    var musicPlayer : MusicPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()

        //demo.text = "Today is a good day to die"
    }
    
    //@IBOutlet weak var demo: CLTypingLabel!
    @IBAction func StartGame1(_ sender: UIButton) {
        self .performSegue(withIdentifier: "startGame1", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "startGame1"){
            let destination = segue.destination as! DrawLotsViewController
            destination.musicPlayer = self.musicPlayer
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
