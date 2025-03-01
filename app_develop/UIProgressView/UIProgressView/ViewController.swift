//
//  ViewController.swift
//  UIProgressView
//
//  Created by 🐴的 on 2023/10/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        progress.progress = 0
    }
    
    @IBOutlet var progress: UIProgressView!
    
    @IBOutlet var activity: UIActivityIndicatorView!
    
    var timer : Timer!
    @IBAction func Go(_ sender: Any) {
        if(t == false){
            t = true
            activity.startAnimating()
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(going), userInfo: nil, repeats: true)
        }
    }
    @objc func going(){
        progress.progress = progress.progress + 0.01
        if(progress.progress == 1){
            timer.invalidate()
            activity.stopAnimating()
        }
    }
    
    
    @IBAction func clear(_ sender: Any) {
        t = false
        progress.progress = 0;
        timer.invalidate()
        activity.stopAnimating()
    }
    
    
    @IBOutlet var message: UIButton!
    
    var t = false
    @IBAction func stop(_ sender: Any) {
        if(t){
            t = false
            timer.invalidate()
            activity.stopAnimating()
        }
    }
}

