import UIKit
import GoogleMobileAds
class CalcViewController: UIViewController ,GADBannerViewDelegate{

    @IBOutlet weak var diplomaNotu: UITextField!
    
    @IBOutlet weak var TYTTurkceDoğru: UITextField!
    @IBOutlet weak var TYTTurkceYanlis: UITextField!
    @IBOutlet weak var TYTSosyalDoğru: UITextField!
    @IBOutlet weak var TYTSosyalYanlis: UITextField!
    @IBOutlet weak var TYTMatDoğru: UITextField!
    @IBOutlet weak var TYTMatYanlis: UITextField!
    @IBOutlet weak var TYTFenDoğru: UITextField!
    @IBOutlet weak var TYTFenYanlis: UITextField!
    
    @IBOutlet weak var AYTIngDogru: UITextField!
    @IBOutlet weak var AYTIngYanlis: UITextField!
    @IBOutlet weak var AYTEdebDogru: UITextField!
    @IBOutlet weak var AYTEdebYanlis: UITextField!
    @IBOutlet weak var AYTTarih1Dogru: UITextField!
    @IBOutlet weak var AYTTarih1Yanlis: UITextField!
    @IBOutlet weak var AYTCografya1Dogru: UITextField!
    @IBOutlet weak var AYTCografya1Yanlis: UITextField!
    @IBOutlet weak var AYTTarih2Dogru: UITextField!
    @IBOutlet weak var AYTTarih2Yanlis: UITextField!
    @IBOutlet weak var AYTCografya2Dogru: UITextField!
    @IBOutlet weak var AYTCografya2Yanlis: UITextField!
    @IBOutlet weak var AYTFelsefeDogru: UITextField!
    @IBOutlet weak var AYTFelsefeYanlis: UITextField!
    @IBOutlet weak var AYTDinDogru: UITextField!
    @IBOutlet weak var AYTDinYanlis: UITextField!
    @IBOutlet weak var AYTMatDogru: UITextField!
    @IBOutlet weak var AYTMatYanlis: UITextField!
    @IBOutlet weak var AYTFizikDogru: UITextField!
    @IBOutlet weak var AYTFizikYanlis: UITextField!
    @IBOutlet weak var AYTKimyaDogru: UITextField!
    @IBOutlet weak var AYTKimyaYanlis: UITextField!
    @IBOutlet weak var AYTBioDogru: UITextField!
    @IBOutlet weak var AYTBioYanlis: UITextField!
    
    @IBOutlet weak var tytScore1: UILabel!
    @IBOutlet weak var tytScore2: UILabel!
    @IBOutlet weak var say1Score: UILabel!
    @IBOutlet weak var say2Score: UILabel!
    @IBOutlet weak var soz1Score: UILabel!
    @IBOutlet weak var soz2Score: UILabel!
    @IBOutlet weak var ea1Score: UILabel!
    @IBOutlet weak var ea2Score: UILabel!
    @IBOutlet weak var dil1Score: UILabel!
    @IBOutlet weak var dil2Score: UILabel!
    
    @IBOutlet weak var diplomaNotuLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    
    
    var tytTurkceNet:Double = 0
    var tytSosyalNet:Double = 0
    var tytMatNet:Double = 0
    var tytFenNet:Double = 0
    
    var aytIngNet:Double = 0
    var aytEdebNet:Double = 0
    var aytTarih1Net:Double = 0
    var aytTarih2Net:Double = 0
    var aytCografya1Net:Double = 0
    var aytCografya2Net:Double = 0
    var aytFelsefeNet:Double = 0
    var aytDinNet:Double = 0
    var aytMatNet:Double = 0
    var aytFizikNet:Double = 0
    var aytKimyaNet:Double = 0
    var aytBioNet:Double = 0
    
    var bannerView: GADBannerView!
    var maxValues: [UITextField: Double] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4420220643754704/9058367131"
        //bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"  // test
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        
        editDiplomaScore()
        TYTTurkceDoğru.delegate = self
        TYTTurkceYanlis.delegate = self
        TYTSosyalDoğru.delegate = self
        TYTSosyalYanlis.delegate = self
        TYTMatDoğru.delegate = self
        TYTMatYanlis.delegate = self
        TYTFenDoğru.delegate = self
        TYTFenYanlis.delegate = self
        
        AYTIngDogru.delegate = self
        AYTIngYanlis.delegate = self
        AYTEdebDogru.delegate = self
        AYTEdebYanlis.delegate = self
        AYTTarih1Dogru.delegate = self
        AYTTarih1Yanlis.delegate = self
        AYTTarih2Dogru.delegate = self
        AYTTarih2Yanlis.delegate = self
        AYTCografya1Dogru.delegate = self
        AYTCografya1Yanlis.delegate = self
        AYTCografya2Dogru.delegate = self
        AYTCografya2Yanlis.delegate = self
        AYTMatDogru.delegate = self
        AYTMatYanlis.delegate = self
        AYTFelsefeDogru.delegate = self
        AYTFelsefeYanlis.delegate = self
        AYTDinDogru.delegate = self
        AYTDinYanlis.delegate = self
        AYTFizikDogru.delegate = self
        AYTFizikYanlis.delegate = self
        AYTKimyaDogru.delegate = self
        AYTKimyaYanlis.delegate = self
        AYTBioDogru.delegate = self
        AYTBioYanlis.delegate = self
        diplomaNotuLabel.layer.cornerRadius = 10
        diplomaNotuLabel.layer.masksToBounds = true
        calcButton.layer.cornerRadius = 15
        calcButton.layer.masksToBounds = true
        maxValue()
        
  
    }

    @IBAction func backButton(_ sender: Any) { dismiss(animated: false) }
    
    @IBAction func calcButton(_ sender: Any) {
        let obp = calcOBP()
        let TYTScore1 = calcTYT() + 100
        let TYTScore2 = TYTScore1 + obp
        
        let SayScore1 = calcSay()  + (calcTYT() * 0.4) + 100
        let SayScore2 = SayScore1 + obp
        
        let SozScore1 = calcSoz() + (calcTYT() * 0.4 ) + 100
        let SozScore2 = SozScore1 + obp
        
        let EAScore1 = calcEA() + (calcTYT() * 0.4) + 100
        let EAScore2 = EAScore1 + obp
        
        let DİlScore = calcDil() + (calcTYT() * 0.4) + 100
        let DİlScore2 = DİlScore + obp
        
        tytScore1.text = String(format: "%.2f",TYTScore1)
        tytScore2.text = String(format: "%.2f",TYTScore2)
        say1Score.text = String(format: "%.2f",SayScore1)
        say2Score.text = String(format: "%.2f",SayScore2)
        soz1Score.text = String(format: "%.2f",SozScore1)
        soz2Score.text = String(format: "%.2f",SozScore2)
        ea1Score.text = String(format: "%.2f",EAScore1)
        ea2Score.text = String(format: "%.2f",EAScore2)
        dil1Score.text = String(format: "%.2f", DİlScore)
        dil2Score.text = String(format: "%.2f", DİlScore2)

    }
    
    func calcTYT()->Double{
        tytTurkceNet = Net(d: TYTTurkceDoğru.text ?? "0", y: TYTTurkceYanlis.text ?? "0")
        tytSosyalNet = Net(d: TYTSosyalDoğru.text ?? "0", y: TYTSosyalYanlis.text ?? "0")
        tytMatNet = Net(d: TYTMatDoğru.text ?? "0", y: TYTMatYanlis.text ?? "0")
        tytFenNet = Net(d: TYTFenDoğru.text ?? "0", y: TYTFenYanlis.text ?? "0")
        let turkceScore = tytTurkceNet * 3.3
        let sosyalScore = tytSosyalNet * 3.3
        let matScore = tytMatNet * 3.4
        let fenScore = tytFenNet * 3.4
        let TYTScore = turkceScore + sosyalScore + matScore + fenScore
        return TYTScore
    }

    func calcSay()->Double{
        let aytMatX = 3.0
        let aytFizikX = 2.85
        let aytKimyaX = 3.07
        let aytBioX = 3.07
        let edebX = 3.0
        let tarih1X = 2.8
        let cografya1X = 3.3
        let tarih2X = 2.91
        let cografya2X = 2.91
        let felsefeX = 3.0
        let dinX = 3.33
        aytMatNet = Net(d: AYTMatDogru.text ?? "0", y: AYTMatYanlis.text ?? "0")
        aytFizikNet = Net(d: AYTFizikDogru.text ?? "0", y: AYTFizikYanlis.text ?? "0")
        aytKimyaNet = Net(d: AYTKimyaDogru.text ?? "0", y: AYTKimyaYanlis.text ?? "0")
        aytBioNet = Net(d: AYTBioDogru.text ?? "0", y: AYTBioYanlis.text ?? "0")
        let mat = aytMatNet * 3.0
        let fizik = aytFizikNet * 2.85
        let kimya = aytKimyaNet * 3.07
        let bio = aytBioNet * 3.07
        let sayScore = mat + fizik + kimya + bio
        return sayScore
    }
    
    func calcSoz()-> Double{
        aytEdebNet = Net(d: AYTEdebDogru.text ?? "0", y: AYTEdebYanlis.text ?? "0")
        aytTarih1Net = Net(d: AYTTarih1Dogru.text ?? "0", y: AYTTarih1Yanlis.text ?? "0")
        aytTarih2Net = Net(d: AYTTarih2Dogru.text ?? "0", y: AYTTarih2Yanlis.text ?? "0")
        aytCografya1Net = Net(d: AYTCografya1Dogru.text ?? "0", y: AYTCografya1Yanlis.text ?? "0")
        aytCografya2Net = Net(d: AYTCografya2Dogru.text ?? "0", y: AYTCografya2Yanlis.text ?? "0")
        aytFelsefeNet = Net(d: AYTFelsefeDogru.text ?? "0", y: AYTFelsefeYanlis.text ?? "0")
        aytDinNet = Net(d: AYTDinDogru.text ?? "0", y: AYTDinYanlis.text ?? "0")
        
        let edeb = aytEdebNet * 3.0
        let tarih1 = aytTarih1Net * 2.8
        let tarih2 = aytTarih2Net * 2.91
        let cografya1 = aytCografya1Net * 3.33
        let cografya2 = aytCografya2Net * 2.91
        let felsefe = aytFelsefeNet * 3.0
        let din = aytDinNet * 3.33
        let sozScore = edeb + tarih1 + tarih2 + cografya1 + cografya2 + felsefe + din
        return sozScore
        
    }
    
    func calcEA()->Double{
        aytMatNet = Net(d: AYTMatDogru.text ?? "0", y: AYTMatYanlis.text ?? "0")
        aytEdebNet = Net(d: AYTEdebDogru.text ?? "0", y: AYTEdebYanlis.text ?? "0")
        aytTarih1Net = Net(d: AYTTarih1Dogru.text ?? "0", y: AYTTarih1Yanlis.text ?? "0")
        aytCografya1Net = Net(d: AYTCografya1Dogru.text ?? "0", y: AYTCografya1Yanlis.text ?? "0")
        let mat = aytMatNet * 3.0
        let edeb = aytEdebNet * 3.0
        let tarih = aytTarih1Net * 2.8
        let cografya = aytCografya1Net * 3.33
        let eaScore = mat + edeb + cografya + tarih
        return eaScore
        
    }
    func calcDil()->Double{
        aytIngNet = Net(d: AYTIngDogru.text ?? "0", y: AYTIngYanlis.text ?? "0")
        var Ing = aytIngNet * 3.0
        return Ing
    }
    func Net(d:String,y:String)->Double{
        let dogru = Double(d)
        let yanlis = Double(y)
        let net = (dogru ?? 0) - ((yanlis ?? 0)/4)
        return net
    }
    func calcOBP()->Double{
        let obp = Double(diplomaNotu.text ?? "")
        let obp2 = (obp ?? 50) * 0.6
        return obp2
    }
    
    func editDiplomaScore(){
        _ = UIColor(named: "tema")
        diplomaNotu.layer.cornerRadius = 10
        diplomaNotu.layer.masksToBounds = true
        diplomaNotu.layer.borderColor = UIColor(named: "tema1")?.cgColor
        diplomaNotu.layer.borderWidth = 1
    }
    
    func maxValue(){
        maxValues[diplomaNotu] = 100.0
        
        maxValues[TYTTurkceDoğru] = 40.0
        maxValues[TYTTurkceYanlis] = 40.0
        maxValues[TYTSosyalDoğru] = 20.0
        maxValues[TYTSosyalYanlis] = 20.0
        maxValues[TYTMatDoğru] = 40.0
        maxValues[TYTMatYanlis] = 40.0
        maxValues[TYTFenDoğru] = 20.0
        maxValues[TYTFenYanlis] = 20.0
        
        maxValues[AYTIngDogru] = 80.0
        maxValues[AYTIngYanlis] = 80.0
        maxValues[AYTEdebDogru] = 24.0
        maxValues[AYTEdebYanlis] = 24.0
        maxValues[AYTTarih1Dogru] = 10.0
        maxValues[AYTTarih1Yanlis] = 10.0
        maxValues[AYTTarih2Dogru] = 11.0
        maxValues[AYTTarih2Yanlis] = 11.0
        maxValues[AYTCografya1Dogru] = 6.0
        maxValues[AYTCografya1Yanlis] = 6.0
        maxValues[AYTCografya2Dogru] = 11.0
        maxValues[AYTCografya2Yanlis] = 11.0
        maxValues[AYTMatDogru] = 40.0
        maxValues[AYTMatYanlis] = 40.0
        maxValues[AYTFelsefeDogru] = 12.0
        maxValues[AYTFelsefeYanlis] = 12.0
        maxValues[AYTDinDogru] = 6.0
        maxValues[AYTDinYanlis] = 6.0
        maxValues[AYTFizikDogru] = 14.0
        maxValues[AYTFizikYanlis] = 14.0
        maxValues[AYTKimyaDogru] = 13.0
        maxValues[AYTKimyaYanlis] = 13.0
        maxValues[AYTBioDogru] = 13.0
        maxValues[AYTBioYanlis] = 13.0
    }
    
}




extension CalcViewController:UITextFieldDelegate{
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           let currentText = textField.text ?? ""
           guard let stringRange = Range(range, in: currentText) else { return false }
           let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
    
        if let value = Double(updatedText), let maxValue = maxValues[textField] {
               return value <= maxValue
           }
           return true  // Sayıya dönüştürülemezse izin ver (örn. boş metin)
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
}
