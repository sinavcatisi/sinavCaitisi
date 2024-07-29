import UIKit
import FirebaseFirestore
import SDWebImage
import GoogleMobileAds

class ProgramDetailsViewController: UIViewController, GADBannerViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textf: UITextField!
    var pickerview:UIPickerView?
    
    var bannerView: GADBannerView!
    
    var weeks = [String]()  // prepareden gelen
    var programArray = [program]() // prepareden gelen
    var array1 = [String]()
    
    var hafta = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerview = UIPickerView()
        pickerview?.delegate = self
       
        tableView.delegate = self
        tableView.dataSource = self
        textf.inputView = pickerview
        toolbar()
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4420220643754704/4435437670"
        //bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"  // test
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        print(hafta)
 
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
    
    func toolbar(){
        let toolbar = UIToolbar()
        let dateToolbar = UIToolbar()
        toolbar.tintColor = UIColor.blue
        toolbar.sizeToFit()
        dateToolbar.tintColor = UIColor(named: "tema1")
        dateToolbar.sizeToFit()
        let OKButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.closeKeyboard))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([space,OKButton], animated: true)
        textf.inputAccessoryView = toolbar
    }
    
    
    @objc func closeKeyboard(){view.endEditing(true)}
    @IBAction func backButton(_ sender: Any) {dismiss(animated: false)}
    
}


extension ProgramDetailsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if programArray[hafta].url1 != "a"{array1 = [programArray[hafta].url1!]}
        if programArray[hafta].url2 != "a"{array1 = [programArray[hafta].url1!,programArray[hafta].url2!]}
        if programArray[hafta].url3 != "a"{array1 = [programArray[hafta].url1!,programArray[hafta].url2!,programArray[hafta].url3!]}
        if programArray[hafta].url4 != "a"{array1 = [programArray[hafta].url1!,programArray[hafta].url2!,programArray[hafta].url3!,programArray[hafta].url4!]}
        if programArray[hafta].url5 != "a"{array1 = [programArray[hafta].url1!,programArray[hafta].url2!,programArray[hafta].url3!,programArray[hafta].url4!,programArray[hafta].url5!]}
        if programArray[hafta].url6 != "a"{array1 = [programArray[hafta].url1!,programArray[hafta].url2!,programArray[hafta].url3!,programArray[hafta].url4!,programArray[hafta].url5!,programArray[hafta].url6!]}
        if programArray[hafta].url7 != "a"{
            array1 = [programArray[hafta].url1!,programArray[hafta].url2!,programArray[hafta].url3!,programArray[hafta].url4!,programArray[hafta].url5!,programArray[hafta].url6!,programArray[hafta].url7!]
        }
        if programArray[hafta].url8 != "a"{
            array1 = [programArray[hafta].url1!,programArray[hafta].url2!,programArray[hafta].url3!,programArray[hafta].url4!,programArray[hafta].url5!,programArray[hafta].url6!,programArray[hafta].url7!,programArray[hafta].url8!]
        }
        
       
       
        
        
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programDetailsCell") as! ProgramDetailsTableViewCell
        
        cell.Img.sd_setImage(with: URL(string: array1[indexPath.row] )   )
            cell.Img.autoresizingMask = [.flexibleWidth]
            cell.Img.translatesAutoresizingMaskIntoConstraints = true
        
        return cell
    }
}


extension ProgramDetailsViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {return 1}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {return weeks.count}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {return weeks[row]}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textf.text = weeks[row]
        switch row{
        case 0 : hafta = 0
        case 1 : hafta = 1
        case 2 : hafta = 2
        case 3 : hafta = 3
        case 4 : hafta = 4
        case 5 : hafta = 5
        case 6 : hafta = 6
        case 7 : hafta = 7
        case 8 : hafta = 8
        case 10 : hafta = 10
        case 11 : hafta = 11
        case 12 : hafta = 12
        case 13 : hafta = 13
        case 14 : hafta = 14
        case 15 : hafta = 15
        case 16 : hafta = 16
        case 17 : hafta = 17
        case 18 : hafta = 18
        case 19 : hafta = 19
        case 20 : hafta = 20
        case 21 : hafta = 21
        case 22 : hafta = 22
        case 23 : hafta = 23
        case 24 : hafta = 24
        case 25 : hafta = 25
        case 26 : hafta = 26
        default: hafta = 1
        }
        tableView.reloadData()
    }
}
