import UIKit

class Rookie1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var questionKind = ""
    
    @IBAction func Rookie1GoToQuestion(_ sender: UIButton) {
        questionKind = (sender.titleLabel?.text)!
        self.performSegue(withIdentifier: "question1", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! QuestionViewController
        destination.questionKind = questionKind
    }
    
    @IBAction func getBack(_ sender: Any) {
        dismiss(animated: true)
    }
}
