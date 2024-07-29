import UIKit
import Firebase
import FirebaseFirestore

class LessonContentViewController: UIViewController {

    var LessonContentPresenterObject:ViewToPresenterLessonContentPageProtocol?
    @IBOutlet weak var tableView: UITableView!
    var exams = ["TYT","AYT"]
    var tyt = [lesson]()
    var ayt = [lesson]()
   
    var xx = [[lesson](),[lesson]()]
    var tytListMatematik = [topics]()
    var tytListTurkce = [topics]()
    var tytListGeometri = [topics]()
    var tytListFizik = [topics]()
    var tytListKimya = [topics]()
    var tytListBiyoloji = [topics]()
    var tytListTarih = [topics]()
    var tytListCografya = [topics]()
    var tytListFelsefe = [topics]()
    var tytListDin = [topics]()
    
    var aytListMatematik = [topics]()
    var aytListEdebiyat = [topics]()
    var aytListGeometri = [topics]()
    var aytListFizik = [topics]()
    var aytListKimya = [topics]()
    var aytListBiyoloji = [topics]()
    var aytListTarih = [topics]()
    var aytListCografya = [topics]()
    var aytListFelsefe = [topics]()
    var aytListDin = [topics]()
    var aytListIng = [topics]()
   
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var topVİew: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        LessonContentPageRouter.createModul(ref: self )
        //topVİew.backgroundColor = UIColor(named: "tema1")?.cgColor
        
        tableView.delegate = self
        tableView.dataSource = self
       
        
        let tytArray = ["tytMatematik","tytTurkce","tytGeometri","tytFizik","tytKimya","tytBiyoloji","tytTarih","tytCografya","tytFelsefe","tytDin"]
        let aytArray = ["aytMatematik","aytEdebiyat","aytGeometri","aytFizik","aytKimya","aytBiyoloji","aytTarih","aytCografya","aytFelsefe","aytDin","aytIng"]

        for item in tytArray { LessonContentPresenterObject?.getData1(lesson: item)}
        for item2 in aytArray { LessonContentPresenterObject?.getData1(lesson: item2) }

        let tytMatematik = lesson(name: "Matematik", topic:tytListMatematik)
        let tytTurkce = lesson(name: "Türkçe", topic: tytListTurkce)
        let tytFizik = lesson(name: "Fizik", topic: tytListFizik)
        let tytKimya = lesson(name: "Kimya", topic: tytListKimya)
        let tytBiyoloji = lesson(name: "Biyoloji", topic: tytListBiyoloji)
        let tytGeometri = lesson(name: "Geometri", topic: tytListGeometri)
        let tytCografya = lesson(name: "Coğrafya", topic: tytListCografya)
        let tytTarih = lesson(name: "Tarih", topic: tytListTarih)
        let tytDin = lesson(name: "Din", topic: tytListDin)
        let tytFelsefe = lesson(name: "Felsefe", topic: tytListFelsefe)
        let aytMatematik = lesson(name: "Matematik", topic:aytListMatematik)
        let aytEdebiyat = lesson(name: "Edebiyat", topic: aytListEdebiyat)
        let aytFizik = lesson(name: "Fizik", topic: aytListFizik)
        let aytKimya = lesson(name: "Kimya", topic: aytListKimya)
        let aytBiyoloji = lesson(name: "Biyoloji", topic: aytListBiyoloji)
        let aytGeometri = lesson(name: "Geometri", topic: aytListGeometri)
        let aytCografya = lesson(name: "Coğrafra", topic: aytListCografya)
        let aytTarih = lesson(name: "Tarih", topic: aytListTarih)
        let aytDin = lesson(name: "Din", topic: aytListDin)
        let aytFelsefe = lesson(name: "Felsefe", topic: aytListFelsefe)
        let aytIng = lesson(name: "İngilizce", topic: aytListIng)

        
        tyt.append(tytTurkce)
        tyt.append(tytMatematik)
        tyt.append(tytGeometri)
        tyt.append(tytFizik)
        tyt.append(tytKimya)
        tyt.append(tytBiyoloji)
        tyt.append(tytTarih)
        tyt.append(tytCografya)
        tyt.append(tytFelsefe)
        tyt.append(tytDin)
        
        ayt.append(aytEdebiyat)
        ayt.append(aytMatematik)
        ayt.append(aytGeometri)
        ayt.append(aytFizik)
        ayt.append(aytKimya)
        ayt.append(aytBiyoloji)
        ayt.append(aytTarih)
        ayt.append(aytCografya)
        ayt.append(aytFelsefe)
        ayt.append(aytDin)
        ayt.append(aytIng)

        xx = [tyt,ayt]
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? IndexPath
        let row = indeks?.row as? Int
        let section = indeks?.section as? Int
        if segue.identifier == "toLessons" {
            let gidilecekVC = segue.destination as! TopicsViewController
            if section == 0 && row == 0{ gidilecekVC.tytTopicsArray1 = tytListTurkce}
            else if section == 0 && row == 1{gidilecekVC.tytTopicsArray1 = tytListMatematik}
            else if section == 0 && row == 2{gidilecekVC.tytTopicsArray1 = tytListGeometri}
            else if section == 0 && row == 3{gidilecekVC.tytTopicsArray1 = tytListFizik}
            else if section == 0 && row == 4{gidilecekVC.tytTopicsArray1 = tytListKimya}
            else if section == 0 && row == 5{gidilecekVC.tytTopicsArray1 = tytListBiyoloji}
            else if section == 0 && row == 6{gidilecekVC.tytTopicsArray1 = tytListTarih}
            else if section == 0 && row == 7{gidilecekVC.tytTopicsArray1 = tytListCografya}
            else if section == 0 && row == 8{gidilecekVC.tytTopicsArray1 = tytListFelsefe}
            else if section == 0 && row == 9{gidilecekVC.tytTopicsArray1 = tytListDin}
            else if section == 1 && row == 0{gidilecekVC.tytTopicsArray1 = aytListEdebiyat}
            else if section == 1 && row == 1{gidilecekVC.tytTopicsArray1 = aytListMatematik}
            else if section == 1 && row == 2{gidilecekVC.tytTopicsArray1 = aytListGeometri}
            else if section == 1 && row == 3{gidilecekVC.tytTopicsArray1 = aytListFizik}
            else if section == 1 && row == 4{gidilecekVC.tytTopicsArray1 = aytListKimya}
            else if section == 1 && row == 5{gidilecekVC.tytTopicsArray1 = aytListBiyoloji}
            else if section == 1 && row == 6{gidilecekVC.tytTopicsArray1 = aytListTarih}
            else if section == 1 && row == 7{gidilecekVC.tytTopicsArray1 = aytListCografya}
            else if section == 1 && row == 8{gidilecekVC.tytTopicsArray1 = aytListFelsefe}
            else if section == 1 && row == 9{gidilecekVC.tytTopicsArray1 = aytListDin}
            else if section == 1 && row == 10{gidilecekVC.tytTopicsArray1 = aytListIng
}
            
        }
    }
   
    @IBAction func backButton(_ sender: Any) { dismiss(animated: false)}
    
}

extension LessonContentViewController: PresenterToViewLessonContentPageProtocol{
    func sendDataToView(topicListInPresenter: Array<topics>, lesson: String) {
        
        if lesson == "tytMatematik"{ tytListMatematik = topicListInPresenter }
        else if lesson == "tytTurkce"{ tytListTurkce = topicListInPresenter}
        else if lesson == "tytGeometri"{tytListGeometri = topicListInPresenter}
        else if lesson == "tytFizik"{tytListFizik = topicListInPresenter}
        else if lesson == "tytKimya"{tytListKimya = topicListInPresenter}
        else if lesson == "tytBiyoloji"{tytListBiyoloji = topicListInPresenter}
        else if lesson == "tytTarih"{tytListTarih = topicListInPresenter}
        else if lesson == "tytCografya"{tytListCografya = topicListInPresenter}
        else if lesson == "tytFelsefe"{tytListFelsefe = topicListInPresenter}
        else if lesson == "tytDin"{tytListDin = topicListInPresenter}
        else if lesson == "aytEdebiyat"{aytListEdebiyat = topicListInPresenter}
        else if lesson == "aytMatematik"{aytListMatematik = topicListInPresenter}
        else if lesson == "aytGeometri"{aytListGeometri = topicListInPresenter}
        else if lesson == "aytFizik"{aytListFizik = topicListInPresenter}
        else if lesson == "aytKimya"{aytListKimya = topicListInPresenter}
        else if lesson == "aytBiyoloji"{aytListBiyoloji = topicListInPresenter}
        else if lesson == "aytTarih"{aytListTarih = topicListInPresenter}
        else if lesson == "aytCografya"{aytListCografya = topicListInPresenter}
        else if lesson == "aytFelsefe"{aytListFelsefe = topicListInPresenter}
        else if lesson == "aytDin"{aytListDin = topicListInPresenter}
        else if lesson == "aytIng"{aytListIng = topicListInPresenter}
    }
    
   
}

extension LessonContentViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int { return exams.count}
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {return exams[section]}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return xx[section].count}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell") as! LessonContentTableViewCell
        cell.lessonName.text = xx[indexPath.section][indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor(named: "tema1")
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {performSegue(withIdentifier: "toLessons", sender: indexPath)}
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {return 50}
}
