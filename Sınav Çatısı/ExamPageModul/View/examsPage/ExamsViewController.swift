import UIKit

class ExamsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dizi = [exam]()
    var a = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        for i in 0..<dizi.count {
            if let lessonName = dizi[i].lesssonName {
                a.append(lessonName)
            } else {
                print("dizi[\(i)].lesssonName değeri nil veya dizi elemanı yok")
            }
        }

    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    

}


extension ExamsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "examsCell") as! examsTableViewCell
        cell.label.text = a[indexPath.row]
        cell.label.layer.masksToBounds = true
        cell.label.layer.cornerRadius = 20
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toExamDetails", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeksPath = sender as? Int
        if segue.identifier == "toExamDetails" {
            let gidilecekVC = segue.destination as! ExamDetailsViewController
            if indeksPath == 0{
                gidilecekVC.examObject = dizi[0]
            }else if indeksPath == 1{
                gidilecekVC.examObject = dizi[1]
            }else if indeksPath == 2{
                gidilecekVC.examObject = dizi[2]
            }else if indeksPath == 3{
                gidilecekVC.examObject = dizi[3]
            }else if indeksPath == 4{
                gidilecekVC.examObject = dizi[4]
            }else if indeksPath == 5{
                gidilecekVC.examObject = dizi[5]
            }else if indeksPath == 6{
                gidilecekVC.examObject = dizi[6]
            }else if indeksPath == 7{
                gidilecekVC.examObject = dizi[7]
            }else if indeksPath == 8{
                gidilecekVC.examObject = dizi[8]
            }else  {
                gidilecekVC.examObject = dizi[0]
            }
        }
        
    }
    
}
