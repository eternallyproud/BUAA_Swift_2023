//
//  ViewController.swift
//  read
//
//  Created by 🐴的 on 2023/11/23.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    let player = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func play(){
        let content:String = "天黑请闭眼，狼人请睁眼，请选择你们要猎杀的对象。"
        let utterance = AVSpeechUtterance(string: content)
        player.speak(utterance)
    }
}

