//
//  ViewController.swift
//  UIAlert
//
//  Created by 🐴的 on 2023/10/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var text: UITextView!
    
    @IBAction func warning1(_ sender: Any) {
        let alert :UIAlertController = UIAlertController(title: "WARNING", message: "ARE YOU SURE YOU WANT TO CLEAR", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "CANCEL", style: .cancel)
        let sure = UIAlertAction(title: "CLEAR", style: .default,handler:{(UIAlertAction)->Void in self.text.text = ""})
        alert.addAction(cancel)
        alert.addAction(sure)
        self.present(alert,animated: true)
    }
    @IBAction func warning2(_ sender: Any) {
        let alert :UIAlertController = UIAlertController(title: "WARNING", message: "ARE YOU SURE YOU WANT TO CLEAR", preferredStyle: UIAlertController.Style.actionSheet)
        let cancel = UIAlertAction(title: "CANCEL", style: .cancel)
        let sure = UIAlertAction(title: "CLEAR", style: .default,handler:{(UIAlertAction)->Void in self.text.text = ""})
        alert.addAction(cancel)
        alert.addAction(sure)
        self.present(alert,animated: true)
    }
    
}

