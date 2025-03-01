import UIKit

class Main_Controller: UITableViewController {
    
    var studentInfo : StudentInfo! = StudentInfo()
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentInfo.students.count
    }
    
    @IBAction func addStudent(_ sender: Any) {
        let student = studentInfo.add()
        let index = studentInfo.students.firstIndex(of: student)!
        let indexpath = IndexPath(row: index, section: 0)
        tableView.insertRows(at: [indexpath], with: .automatic)
    }
    
    @IBAction func edit(_ sender: Any) {
        if isEditing {
            (sender as! UIButton).setTitle("EDIT", for: .normal)
            setEditing(false, animated: true)
        }
        else{
            (sender as! UIButton).setTitle("SUBMIT", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableView", for: indexPath) as! TableViewCell
        let student = studentInfo.students[indexPath.row]
        //cell.textLabel?.text = student.name
        cell.name.text = student.name
        //cell.detailTextLabel?.text = String(student.score)
        cell.score.text = String(student.score)
        cell.number.text = String(student.id)
        return cell
    }
    override func viewDidLoad() {
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let student = studentInfo.students[indexPath.row]
            studentInfo.delet(student: student)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        //} else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        //}
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {studentInfo.transe(from: fromIndexPath.row, to: to.row)
        
    }
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
