import UIKit

class MusicViewController: UIViewController {
    var musicPlayer : MusicPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(musicPlayer == nil){
            musicPlayer = MusicPlayer()
        }
        updateUI()
    }
    func updateUI(){
        if(musicPlayer.isPlaying()){
            playButtonImage.image = UIImage(systemName: "pause.fill")
        }
        else{
            playButtonImage.image = UIImage(systemName: "play.fill")
        }
    }
    @IBAction func PlayMusic(_ sender: Any) {
        musicPlayer.play()
        updateUI()
    }
    
    @IBAction func SelectMusic(_ sender: UIButton) {
        musicPlayer.select(sender.titleLabel!.text!)
        updateUI()
    }
    
    @IBAction func Last(_ sender: Any) {
        musicPlayer.last()
        musicPlayer.play()
        updateUI()
    }
    
    @IBAction func Next(_ sender: Any) {
        musicPlayer.next()
        musicPlayer.play()
        updateUI()
    }
    
    @IBAction func JumpToSound(_ sender: UIButton) {
        performSegue(withIdentifier: "sound", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sound"){
            let destination = segue.destination as! SoundViewController
            destination.musicPlayer = self.musicPlayer
            destination.preferredContentSize = CGSizeMake(388, 100)
        }
    }
    @IBOutlet weak var playButtonImage: UIImageView!
}
