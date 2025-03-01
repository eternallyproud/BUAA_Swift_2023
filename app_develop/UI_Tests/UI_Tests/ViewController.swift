//
//  ViewController.swift
//  UI_Tests
//
//  Created by 🐴的 on 2023/10/12.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var times: UILabel!
    var count = 0;
    
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var state: UILabel!
    
    @IBOutlet weak var slid: UISlider!
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet var select: UISegmentedControl!
    @IBOutlet var sstate: UILabel!
    
    var string : [String] = ["First","Second","Third"]
    
    
    
    @IBAction func Botton(_ sender: UIButton) {
        count += 1;
        times.text = "\(count)";
    }
    
    
    @IBAction func Switch(_ sender: Any) {
        if(`switch`.isOn){
            state.text = "On"
        }
        else{
            state.text = "Off"
        }
    }
    
    @IBAction func Slider(_ sender: Any) {
        number.text = "\(Int(slid.value))"
    }
    
    @IBAction func S(_ sender: UISegmentedControl) {
        sstate.text = string[select.selectedSegmentIndex]
    }
    
}
