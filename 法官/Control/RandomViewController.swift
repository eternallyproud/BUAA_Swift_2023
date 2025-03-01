import UIKit
import AVFoundation

class RandomViewController: UIViewController {
    var players : Players?
    var playerId : Int?
    var sourceView : DrawLotsViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        unselected = players!.checkPlayer(playerId: playerId!)
        if(!unselected){
            let id = (players!.getPlayerCharachter(playerId: playerId!))
            identity.setImage(#imageLiteral(resourceName: id), for: UIControl.State.normal)
            InfoOfCharacter.backgroundColor = UIColor(red: 41/255, green: 58/255, blue: 70/255, alpha: 0.5)
            InfoOfCharacter.text = players!.dicIdentities[id];
        }
        //finish loading->execute the code below
        //Image Literal
        //#imageLiteral(
    }
    var indextIdentities = 0
    var unselected = true
    
    
    @IBOutlet weak var identity: UIButton!
    
    @IBAction func buttonIdentity(_ sender: Any) {
        
        if(unselected){
            indextIdentities = Int.random(in: 0...(players!.playerNum-1))
            let id = players!.arrayIdentities[indextIdentities]
            identity.setImage(#imageLiteral(resourceName: id), for: UIControl.State.normal)
            players!.arrayIdentities.remove(at: indextIdentities)
            players!.playerNum -= 1
            InfoOfCharacter.backgroundColor = UIColor(red: 41/255, green: 58/255, blue: 70/255, alpha: 0.5)
            InfoOfCharacter.text = players!.dicIdentities[id];
            let player = Player(character: id, playerId: playerId!, liveState: true)
            players!.addPlayer(player: player)
            unselected = false
        }
    }
    
    @IBOutlet weak var InfoOfCharacter: UITextView!
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        if (!unselected){
            sourceView!.dicCheck[playerId!]!.image = #imageLiteral(resourceName: "check")
        }
        super.dismiss(animated: flag, completion: completion)
        if (sourceView!.players.playerNum == 0){
            sourceView!.GameProcess = true
            sourceView!.startGameButton.setTitle("开始游戏", for: UIControl.State.normal)
            sourceView!.startGameButton.tintColor = UIColor.lightGray
            sourceView!.startGameButton.isHidden = false
        }
    }
    @IBAction func CheckCharacter(_ sender: UIButton) {
        performSegue(withIdentifier: "character", sender: self)
    }
    
}
