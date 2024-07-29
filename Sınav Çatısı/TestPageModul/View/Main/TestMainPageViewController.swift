import UIKit
import FirebaseFirestore

class TestMainPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var TestPresenterObject:ViewToPresenterTestPageProtocol?
   
  //  @IBOutlet weak var actInd: UIActivityIndicatorView!
    var lessons = [String]()
    
    var TestTurkce1 = [test]()
    var TestTurkce2 = [test]()
    var TestTurkce3 = [test]()
    var TestMatematik1 = [test]()
    var TestMatematik2 = [test]()
    var TestMatematik3 = [test]()
    var TestFizik1 = [test]()
    var TestFizik2 = [test]()
    var TestFizik3 = [test]()
    var TestKimya1 = [test]()
    var TestKimya2 = [test]()
    var TestKimya3 = [test]()
    var TestBiyoloji1 = [test]()
    var TestBiyoloji2 = [test]()
    var TestBiyoloji3 = [test]()
    var TestTarih1 = [test]()
    var TestTarih2 = [test]()
    var TestTarih3 = [test]()
    var TestCografya1 = [test]()
    var TestCografya2 = [test]()
    var TestCografya3 = [test]()
    var TestIng1 = [test]()
    var TestIng2 = [test]()
    var TestIng3 = [test]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TestPageRouter.createModul(ref: self )
        tableView.delegate = self
        tableView.dataSource = self
        lessons = ["Türkçe","Matematik","Fizik","Kimya","Biyoloji","Tarih","Coğrafya","İngilizce"]
       // tableView.isUserInteractionEnabled = false
       // performYourTask()
        let dizi = ["TestTurkce1","TestTurkce2","TestTurkce3","TestMatematik1","TestMatematik2","TestMatematik3","TestFizik1","TestFizik2","TestFizik3","TestKimya1","TestKimya2","TestKimya3","TestBiyoloji1","TestBiyoloji2","TestBiyoloji3","TestTarih1","TestTarih2","TestTarih3","TestCografya1","TestCografya2","TestCografya3","TestIng1","TestIng2","TestIng3"]

        for item in dizi{TestPresenterObject?.getData1(test1: item)}
        tableView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.tableView.isUserInteractionEnabled = true
           }
        
    }

    @IBAction func backButton(_ sender: Any) {dismiss(animated: false)}
    /*func performYourTask() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
           // self.actInd.stopAnimating()
            self.tableView.isUserInteractionEnabled = true
           // self.actInd.isHidden = true
        }
    }*/
    
}
extension TestMainPageViewController: PresenterToViewTestPageProtocol{
  
    func sendDataToView(testListPresenter: Array<test>, test4: String) {
        
        switch test4 {
        case "TestTurkce1": TestTurkce1 = testListPresenter
        case "TestTurkce2": TestTurkce2 = testListPresenter
        case "TestTurkce3": TestTurkce3 = testListPresenter
        case "TestMatematik1": TestMatematik1 = testListPresenter
        case "TestMatematik2": TestMatematik2 = testListPresenter
        case "TestMatematik3": TestMatematik3 = testListPresenter
        case "TestFizik1": TestFizik1 = testListPresenter
        case "TestFizik2": TestFizik2 = testListPresenter
        case "TestFizik3": TestFizik3 = testListPresenter
        case "TestKimya1":TestKimya1 = testListPresenter
        case "TestKimya2":TestKimya2 = testListPresenter
        case "TestKimya3": TestKimya3 = testListPresenter
        case "TestBiyoloji1": TestBiyoloji1 = testListPresenter
        case "TestBiyoloji2": TestBiyoloji2 = testListPresenter
        case "TestBiyoloji3": TestBiyoloji3 = testListPresenter
        case "TestTarih1": TestTarih1 = testListPresenter
        case "TestTarih2": TestTarih2 = testListPresenter
        case "TestTarih3": TestTarih3 = testListPresenter
        case "TestCografya1": TestCografya1 = testListPresenter
        case "TestCografya2": TestCografya2 = testListPresenter
        case "TestCografya3": TestCografya3 = testListPresenter
        case "TestIng1": TestIng1 = testListPresenter
        case "TestIng2": TestIng2 = testListPresenter
        case "TestIng3": TestIng3 = testListPresenter
        default:break
        }

    }
}


extension TestMainPageViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardsMainCell") as! TestMainPageTableViewCell
        cell.label.text = lessons[indexPath.row]
        cell.label.layer.cornerRadius = 20
        cell.label.layer.masksToBounds = true
        cell.label.layer.shadowColor = UIColor.black.cgColor
        cell.label.layer.shadowOpacity = 0.5
        cell.label.layer.shadowOffset = CGSize(width: 4, height: 4)
        cell.label.layer.shadowRadius = 5
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toTests", sender: indexPath.row)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let row =  sender as? Int
        
        if segue.identifier == "toTests" {
            let gidilecekVC = segue.destination as! TestViewController
            
            if row == 0{
                gidilecekVC.array1 = TestTurkce1
                gidilecekVC.array2 = TestTurkce2
                gidilecekVC.array3 = TestTurkce3
            }else if row == 1{
                gidilecekVC.array1 = TestMatematik1
                gidilecekVC.array2 = TestMatematik2
                gidilecekVC.array3 = TestMatematik3
            }else if row == 2{
                gidilecekVC.array1 = TestFizik1
                gidilecekVC.array2 = TestFizik2
                gidilecekVC.array3 = TestFizik3
            }else if row == 3{
                gidilecekVC.array1 = TestKimya1
                gidilecekVC.array2 = TestKimya2
                gidilecekVC.array3 = TestKimya3
            }else if row == 4{
                gidilecekVC.array1 = TestBiyoloji1
                gidilecekVC.array2 = TestBiyoloji2
                gidilecekVC.array3 = TestBiyoloji3
            }else if row == 5{
                gidilecekVC.array1 = TestTarih1
                gidilecekVC.array2 = TestTarih2
                gidilecekVC.array3 = TestTarih3
                
            }else if row == 6{
                gidilecekVC.array1 = TestCografya1
                gidilecekVC.array2 = TestCografya2
                gidilecekVC.array3 = TestCografya3
            }else if row == 7{
                gidilecekVC.array1 = TestIng1
                gidilecekVC.array2 = TestIng2
                gidilecekVC.array3 = TestIng3
            }
            
        }
    }
}
