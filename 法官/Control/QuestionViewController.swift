import UIKit

class QuestionViewController: UIViewController {
    var questionKind : String?
    var Q = Questions(questionNum: 0, questions: [])
    var ButtonDic : [Int:UIButton] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        currentNum = 0
        Button1.textColor = UIColor.black
        Button2.textColor = UIColor.black
        Button3.textColor = UIColor.black
        Q.SetUp(questionKind!)
        questions = Q.questions
        questionNum = Q.questionNum
        updateUI()
        ButtonDic = [1:b1,2:b2,3:b3]
    }
    @objc func updateUI(){
        if(currentNum == questionNum){
            dismiss(animated: true)
        }
        else{
            bar.progress = Float(currentNum+1)/Float(questions.count)
            Button1.text = questions[currentNum].answer[0]
            b1.backgroundColor = UIColor.white
            
            Button2.text = questions[currentNum].answer[1]
            b2.backgroundColor = UIColor.white
            
            Button3.text = questions[currentNum].answer[2]
            b3.backgroundColor = UIColor.white
            
            QuestionLable.text = questions[currentNum].question
        }
    }
    var currentNum = 0
    var questions = [Question]()
    /*[
        Question(question: "下列哪句话不属于贴脸", answer: ["我要是狼人我跟你姓","他言行不一，有很大狼面","我要是狼人我就吃桌子"],right: 2),
        Question(question: "下列哪句话属于不会被容忍的场外发言", answer: ["狼人坑不够了，他这个预言家不可信","我在闭眼时听到他有动作，所以他有身份","2号打的实在是太好了，所以第一晚首验了她"],right: 2),
        Question(question: "作为好人被悍跳狼查杀时不该怎么办", answer: ["语言/物理攻击悍跳狼","表明怀疑态度，希望后置位有真预言家正视角","表明怀疑态度，认为他是诈身份/压跳的"],right: 1),
        Question(question: "好人站错边怎么办", answer: ["好好表水，回头是岸","铁了心跟到底，认准一个人不回头","羞愧难当，逃离现场（？"],right: 1),
        
        Question(question: "下列哪种情况属于狼人聊爆", answer: ["提议把两个预言家一起打包带走","要求两个猎人出一个验枪","发言信息量和角度有问题"],right: 3),
    ]*/
    var questionNum = 0
    
    @IBOutlet weak var QuestionLable: UILabel!
    
    @IBOutlet weak var Button1: UILabel!
    @IBOutlet weak var Button2: UILabel!
    @IBOutlet weak var Button3: UILabel!
    
    @IBOutlet weak var bar: UIProgressView!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBAction func next(_ sender: UIButton) {
        //answer
        if ((questions[currentNum].right == 1)&&(sender == b1))||((questions[currentNum].right == 2)&&(sender == b2))||((questions[currentNum].right == 3)&&(sender == b3)) {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        //right answer
        ButtonDic[questions[currentNum].right]?.backgroundColor = UIColor.green
        
        currentNum += 1;
        Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
