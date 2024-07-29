import UIKit
import GoogleMobileAds

class TestDetailsViewController: UIViewController, GADBannerViewDelegate{

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var trueCount = 0
    var falseCount = 0
    
    var arr1 = [test]()
    var indeks = 0
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4420220643754704/2095967370"
       // bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"  // test
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        default1()
        cornerRadius()
        countLabel.text = "\(indeks+1) / \(arr1.count)"
        print("indeks: \(indeks+1)")
        print("arr.count: \(arr1.count)")
        nextButton.isHidden = true
    }
    
    @IBAction func selectA(_ sender: UIButton) { control(tagNumber: sender.tag,selectButton: sender,indeks: indeks,buton1: b2,buton2: b3,buton3: b4,butonSelf: b1)}
    @IBAction func selectB(_ sender: UIButton) { control(tagNumber: sender.tag,selectButton:sender,indeks: indeks,buton1: b1,buton2: b3,buton3: b4,butonSelf: b2)}
    @IBAction func selectC(_ sender: UIButton) { control(tagNumber: sender.tag, selectButton: sender,indeks: indeks,buton1: b1,buton2: b2,buton3: b4,butonSelf: b3)}
    @IBAction func selectD(_ sender: UIButton) { control(tagNumber: sender.tag, selectButton: sender,indeks: indeks,buton1: b1,buton2: b2,buton3: b3,butonSelf: b4)}
    
    
    @IBAction func nextButton(_ sender: Any) {
        if indeks < arr1.count-1{
            self.indeks += 1
            print("indeks: \(indeks+1)")
            print("arr.count: \(arr1.count)")
            countLabel.text = "\(indeks+1) / \(arr1.count)"
            newValue()
            nextButton.isHidden = true
        }else{
            showMessage()
        }
      
    }
    
    func control(tagNumber:Int,selectButton:UIButton,indeks:Int,buton1:UIButton,buton2:UIButton,buton3:UIButton,butonSelf:UIButton){
            if arr1[indeks].trueSelect == String(tagNumber){
               green(buton: selectButton)
                trueCount += 1
                print("Doğru Sayısı: \(trueCount)")
                print("Yanlış Sayısı: \(falseCount)")
            }else{
                falseCount += 1
                print("Doğru Sayısı: \(trueCount)")
                print("Yanlış Sayısı: \(falseCount)")
                red(buton: selectButton)
                if arr1[indeks].trueSelect == String(b1.tag) { green(buton: b1)}
                else if arr1[indeks].trueSelect == String(b2.tag) { green(buton: b2)}
                else if arr1[indeks].trueSelect == String(b3.tag) { green(buton: b3) }
                else if arr1[indeks].trueSelect == String(b4.tag) { green(buton: b4) }
            }
        enable(enab: false)
        if indeks+1 == arr1.count{ nextButton.setTitle("Testi Bitir.", for: .normal) }
        nextButton.isHidden = false
    }
    
    func green(buton:UIButton){
        buton.layer.borderWidth = 4
        buton.layer.masksToBounds = true
        buton.layer.borderColor = UIColor.systemBlue.cgColor
        
    }
    func red(buton:UIButton){
        buton.layer.borderWidth = 4
        buton.layer.masksToBounds = true
        buton.layer.borderColor = UIColor.red.cgColor
    }
    func newValue(){
        self.questionLabel.text = self.arr1[indeks].question
        b1.layer.borderWidth = 0
        b2.layer.borderWidth = 0
        b3.layer.borderWidth = 0
        b4.layer.borderWidth = 0
        b1.setTitle("A-) \(self.arr1[indeks].s1)", for: .normal)
        b2.setTitle("B-) \(self.arr1[indeks].s2)", for: .normal)
        b3.setTitle("C-) \(self.arr1[indeks].s3)", for: .normal)
        b4.setTitle("D-) \(self.arr1[indeks].s4)", for: .normal)
        enable(enab: true)
    }
    func default1(){
         b1.tag = 0
         b2.tag = 1
         b3.tag = 2
         b4.tag = 3
         arr1.removeFirst()
         questionLabel.text = arr1[0].question
         b1.setTitle("A-) \(arr1[0].s1)", for: .normal)
         b2.setTitle("B-) \(arr1[0].s2)", for: .normal)
         b3.setTitle("C-) \(arr1[0].s3)", for: .normal)
         b4.setTitle("D-) \(arr1[0].s4)", for: .normal)
    }
    
}












extension TestDetailsViewController{
    
    func showMessage(){
        let alert = UIAlertController(title:"Sonuç", message:"Doğru Sayısı: \(trueCount)\nYanlış Sayısı: \(falseCount)", preferredStyle: UIAlertController.Style.alert)
     //   let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.nextButton.isHidden = true
            }
        okButton.setValue(UIColor(named: "tema1"), forKey: "titleTextColor")
        alert.addAction(okButton)
        self.present(alert, animated: true,completion: nil)
        
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
    func enable(enab:Bool){
        b1.isEnabled = enab
        b2.isEnabled = enab
        b3.isEnabled = enab
        b4.isEnabled = enab
        b1.setTitleColor(.white, for: .disabled)
        b2.setTitleColor(.white, for: .disabled)
        b3.setTitleColor(.white, for: .disabled)
        b4.setTitleColor(.white, for: .disabled)
    }
    @IBAction func backButton(_ sender: Any) { dismiss(animated: false) }
    func cornerRadius(){
        b1.layer.cornerRadius = 10
        b1.layer.masksToBounds = true
        b2.layer.cornerRadius = 10
        b2.layer.masksToBounds = true
        b3.layer.cornerRadius = 10
        b3.layer.masksToBounds = true
        b4.layer.cornerRadius = 10
        b4.layer.masksToBounds = true
        nextButton.layer.cornerRadius = 10
        nextButton.layer.masksToBounds = true
        
    }
}
