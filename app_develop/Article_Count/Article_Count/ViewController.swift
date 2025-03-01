//
//  ViewController.swift
//  Article_Count
//
//  Created by 🐴的 on 2023/10/12.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var str = "";
    var keyword = "";
    
    @IBOutlet weak var output: UILabel!
    
    @IBOutlet weak var article: UITextView!
    
    @IBOutlet weak var input: UITextField!
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            input.becomeFirstResponder();
            return false;
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        str = article.text!
        keyword = input.text!
        str = str.lowercased()
        let count = str.components(separatedBy: keyword).count - 1;
        if(count>1){
            output.text = "\(keyword) appears \(count) times"
        }
        else{
            output.text = "\(keyword) appears \(count) time"
        }
        return true;
    }
}

