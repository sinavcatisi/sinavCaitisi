import UIKit

class TopicsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var tytTopicsArray1 = [topics]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
        tableView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.tableView.isUserInteractionEnabled = true
           }
       
    }

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
}
extension TopicsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tytTopicsArray1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tytCell") as! TopicsCell
        cell.lessonsName.text = tytTopicsArray1[indexPath.row].topicName
        cell.lessonsName.layer.masksToBounds = true
        cell.lessonsName.layer.cornerRadius = 20
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toLessonDetails", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as! Int
        let gidilecekVC = segue.destination as! topicDetailsViewController
        gidilecekVC.tytTopicsArray5 = tytTopicsArray1
        gidilecekVC.indeks5 = indeks
    }

    
    
}
