import UIKit
import FirebaseFirestore

class examMainPageViewController: UIViewController {
    
    var ExamPresenterObject:ViewToPresenterExamPageProtocol?
    @IBOutlet weak var tableView: UITableView!
    var list9 = [exam]()
    var list10 = [exam]()
    var list11 = [exam]()
    var list12 = [exam]()
    var dizi = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExamPageRouter.createModul(ref: self )
        tableView.delegate = self
        tableView.dataSource = self
        dizi = ["9.Sınıf","10.Sınıf","11.Sınıf","12.Sınıf"]
        
        ExamPresenterObject?.getData1(exam1: "Exam9")
        ExamPresenterObject?.getData1(exam1: "Exam10")
        ExamPresenterObject?.getData1(exam1: "Exam11")
        ExamPresenterObject?.getData1(exam1: "Exam12")
        tableView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.tableView.isUserInteractionEnabled = true
           }
    }
    

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
}
extension examMainPageViewController:PresenterToViewExamPageProtocol{
    func sendDataToView(examListPresenter: Array<exam>, exam4: String) {
        if exam4 == "Exam9"{
            list9 = examListPresenter
        }else if exam4 == "Exam10"{
            list10 = examListPresenter
        }else if exam4 == "Exam11"{
            list11 = examListPresenter
        }else if exam4 == "Exam12"{
            list12 = examListPresenter
        }
    }
    
}


extension examMainPageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dizi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "examCell") as! examMainPageTableViewCell
        cell.label.text = dizi[indexPath.row]
        cell.label.layer.masksToBounds = true
        cell.label.layer.cornerRadius = 20
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toExams", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeksPath = sender as? Int
        if segue.identifier == "toExams" {
            let gidilecekVC = segue.destination as! ExamsViewController
            if indeksPath == 0{
                gidilecekVC.dizi = list9
            } else if indeksPath == 1{
                gidilecekVC.dizi = list10
            } else if indeksPath == 2{
                gidilecekVC.dizi = list11
            } else if indeksPath == 3{
                gidilecekVC.dizi = list12
            }
        }
    }
}
