import UIKit

class ProphecyViewController: UIViewController {
    var player : Player?
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(TimeOut), userInfo: nil, repeats: false)
        if ((player?.character == "狼人")||(player?.character == "狼王")){
            result.image = #imageLiteral(resourceName: "坏人")
        }
        else{
            result.image = #imageLiteral(resourceName: "好人")
        }
    }
    
    @objc func TimeOut(){
        dismiss(animated: true)
    }
    
    @IBOutlet weak var result: UIImageView!
}
