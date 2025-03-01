//
//  ViewController.swift
//  HelloWorld
//
//  Created by 🐴的 on 2023/10/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    let dayOfWeek : [String] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
    var index:Int = 0;
    
    @IBOutlet weak var DayOfWeek: UILabel!
    @IBAction func change(_ sender: Any) {
        index += 1;
        if(index==7){
            index = 0;
        }
        DayOfWeek.text = dayOfWeek[index];
    }
}

