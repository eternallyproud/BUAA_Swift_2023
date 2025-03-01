import UIKit

class Rookie2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var questionKind = ""
    
    @IBAction func Rookie2GoToQuestion(_ sender: UIButton) {
        questionKind = (sender.titleLabel?.text)!
        self.performSegue(withIdentifier: "question2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! QuestionViewController
        destination.questionKind = questionKind
    }

    @IBAction func getBack(_ sender: Any) {
        dismiss(animated: true)
    }
}
