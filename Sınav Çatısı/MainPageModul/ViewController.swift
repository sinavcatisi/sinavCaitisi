import UIKit
import FirebaseFirestore
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var dersler: UIImageView!
    @IBOutlet weak var kartlar: UIImageView!
    @IBOutlet weak var program: UIImageView!
    @IBOutlet weak var hesaplama: UIImageView!
   
    @IBOutlet weak var puanButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ay: UILabel!
    @IBOutlet weak var gun: UILabel!
    @IBOutlet weak var saat: UILabel!
    @IBOutlet weak var dakika: UILabel!
    @IBOutlet weak var saniye: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var sayacView: UIView!
    
    var bannerView: GADBannerView!
    
    var targetDate: Date!
    var timer: Timer?
    var urlArrayView = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4420220643754704/4925294783"
        //bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"  // test
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        let gestureContent = UITapGestureRecognizer(target: self, action: #selector(toContent))
        dersler.addGestureRecognizer(gestureContent)
        let gestureCard = UITapGestureRecognizer(target: self, action: #selector(toCard))
        kartlar.addGestureRecognizer(gestureCard)
        let gestureProgram = UITapGestureRecognizer(target: self, action: #selector(toProgram))
        program.addGestureRecognizer(gestureProgram)
        let gestureExam = UITapGestureRecognizer(target: self, action: #selector(toExam))
        hesaplama.addGestureRecognizer(gestureExam)
        let gesture500 = UITapGestureRecognizer(target: self, action: #selector(to500))
        image.addGestureRecognizer(gesture500)
        
        let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
         targetDate = dateFormatter.date(from: "2025-6-8 10:15:00")!
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
        
        DispatchQueue.main.async {
            self.getText()
        }
        
        edit(img: dersler)
        edit(img: kartlar)
        edit(img: program)
        edit(img: hesaplama)
        edit(img: image)
    
        backgroundColor()
        editSayacView()
        puanButton.layer.cornerRadius = 15
        puanButton.layer.masksToBounds = true
 
    }
    override func viewWillAppear(_ animated: Bool) {
        getAdvice()
        getText()
    }
    
    func getAdvice() {
        let db = Firestore.firestore()
        db.collection("advice").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
            } else {
                if let documents = querySnapshot?.documents {
                    self.urlArrayView.removeAll()
                    for document in documents {
                        if let id = document.get("id") as? Int {
                            if let url1 = document.get("url1") as? String {
                                if let url2 = document.get("url2") as? String {
                                     let adv = advice(id: id, url1: url1,url2: url2)
                                    self.urlArrayView.append(adv.url1!)
                                    if url2 != "a"{
                                        self.urlArrayView.append(adv.url2!)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to500" {
            let gidilecekVC = segue.destination as! adviceViewController
            gidilecekVC.urlArrayView = urlArrayView
        }
    }
   func addBannerViewToView(_ bannerView: GADBannerView) {
       bannerView.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(bannerView)
       view.addConstraints(
         [NSLayoutConstraint(item: bannerView,
                             attribute: .bottom,
                             relatedBy: .equal,
                             toItem: view.safeAreaLayoutGuide,
                             attribute: .bottom,
                             multiplier: 1,
                             constant: 0),
          NSLayoutConstraint(item: bannerView,
                             attribute: .centerX,
                             relatedBy: .equal,
                             toItem: view,
                             attribute: .centerX,
                             multiplier: 1,
                             constant: 0)
         ])
      }
   
   
    func edit(img:UIImageView){
        img.layer.cornerRadius = 20
        img.layer.borderWidth = 1
        img.layer.masksToBounds = true
        img.isUserInteractionEnabled = true
    }
    
    func backgroundColor(){
        let startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.01)
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
                let gradientLayer = CAGradientLayer()
                gradientLayer.frame = view.bounds
                gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
                view.layer.insertSublayer(gradientLayer, at: 0)
    }
    func editSayacView(){
        sayacView.layer.cornerRadius = 15
      //  sayacView.layer.borderWidth = 2
        sayacView.layer.masksToBounds = true
       // sayacView.layer.borderColor = CGColor(red: 0, green: 0.5, blue: 0.4, alpha: 0.5)
    }
    
    @objc func toContent(){performSegue(withIdentifier: "toContent", sender: nil)}
    @objc func toCard(){performSegue(withIdentifier: "toTest", sender: nil)}
    @objc func toProgram(){performSegue(withIdentifier: "toProgram", sender: nil)}
    @objc func toExam(){performSegue(withIdentifier: "toExam", sender: nil)}
    @objc func to500(){performSegue(withIdentifier: "to500", sender: nil)}
   
    @objc func updateCountdown() {
           let currentDate = Date()
           let calendar = Calendar.current
           let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate, to: targetDate)
           let monthsLeft = components.month ?? 0
           let daysLeft = components.day ?? 0
           let hoursLeft = components.hour ?? 0
           let minutesLeft = components.minute ?? 0
           let secondsLeft = components.second ?? 0
           ay.text = String(monthsLeft)
           gun.text = String(daysLeft)
           saat.text = String(hoursLeft)
           dakika.text = String(minutesLeft)
           saniye.text = String(secondsLeft)
           
       }
    
    func getText() {
        let db = Firestore.firestore()
        var txt = [String]()
        db.collection("text").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
            } else {
                if let documents = querySnapshot?.documents {
                    for document in documents {
                        if let text = document.get("text") as? String {
                            txt.append(text)
                        }
                    }
                  //  self.label.text = txt[0]
                }
            }
        }
    }
    
    
    
    @IBAction func toChatPage(_ sender: Any) {
        performSegue(withIdentifier: "toChat", sender: nil)
    }
    
}


