

import UIKit
import AdSupport
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageBox: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var dizi = [messageModel]()
    let db = Firestore.firestore()
    let uuid = UUID().uuidString
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        sendButton.layer.cornerRadius = sendButton.frame.size.height / 5
        tableView.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "messageNibCell")
        loadMessage()
    
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           let lastSection = tableView.numberOfSections - 1
           let lastRow = tableView.numberOfRows(inSection: lastSection) - 1
           if lastSection >= 0 && lastRow >= 0 {
               let indexPath = IndexPath(row: lastRow, section: lastSection)
               tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
           }
       // scrollToBottom(animated: true)
       }

    
    
    
    @IBAction func sendMessageButton(_ sender: Any) {
        sendMessage()
        messageBox.text = ""
        tableView.reloadData()
        DispatchQueue.main.async { self.scrollToBottom(animated: true) }
        
     
    }
    func scrollToBottom(animated: Bool) {
        let lastSection = tableView.numberOfSections - 1
        let lastRow = tableView.numberOfRows(inSection: lastSection) - 1
        if lastSection >= 0 && lastRow >= 0 {
            let indexPath = IndexPath(row: lastRow, section: lastSection)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
          
      }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
    }
    
}



extension ChatViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dizi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageNibCell", for: indexPath) as! MessageTableViewCell
        cell.label.text =  dizi[indexPath.row].message
        if dizi[indexPath.row].uu == uuid{
            cell.label.textColor = .blue
        }
        
        return cell
    }
 

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dizi[indexPath.row].uu)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title:"Sil"){(contextualAction,view,bool) in
            let message = self.dizi[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "Mesaj silinsin mi? ", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){action in}
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ [self]action in
                deleteFirestore1(uuid: message.uu)
            }
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}


extension ChatViewController{
    
    func sendMessage(){
        if messageBox != nil{
            db.collection("messages").addDocument(data: ["message" : messageBox.text ?? "","date":Date().timeIntervalSince1970,"uuid":UUID().uuidString]) { (error)  in
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    print("Mesaj gönderme başarılı")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
            }
        }
    }
    
    func loadMessage(){
        db.collection("messages").order(by: "date").addSnapshotListener { (querySnapshot, error) in
            self.dizi = []
            if let e = error{
                print(e.localizedDescription)
            }else{
                if let documents = querySnapshot?.documents{
                    for document in documents{
                            if let topicName = document.get("message") as? String {
                                if let uuid = document.get("uuid") as? String {
                                    let a = messageModel(message: topicName,uu: uuid)
                                        self.dizi.append(a)
                                    
                                }
                                
                            }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
 
    
    
    func deleteFirestore1(uuid:String) {
        let collectionRef = self.db.collection("messages").whereField("uuid", in: [uuid])
        collectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Koleksiyon verilerini alma hatası: \(error.localizedDescription)")
                return
            }
            guard let documents = snapshot?.documents else {
                return
            }
            for document in documents {
                document.reference.delete()
            }
            print("Koleksiyon başarıyla silindi.")
        }
    }

    
}
