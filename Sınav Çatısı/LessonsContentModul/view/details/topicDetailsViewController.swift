import UIKit
import SDWebImage
import GoogleMobileAds

class topicDetailsViewController: UIViewController, GADBannerViewDelegate{

    var tytTopicsArray5 = [topics]()
    var indeks5 : Int?
    
    @IBOutlet weak var tableView: UITableView!
    var dizi = [String]()
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4420220643754704/8302526921"
       // bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"  // test
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        
        dizi.append(tytTopicsArray5[indeks5!].url1!)
       
        if tytTopicsArray5[indeks5!].url2! != "a" {dizi.append(tytTopicsArray5[indeks5!].url2!)}
        if tytTopicsArray5[indeks5!].url3! != "a" {dizi.append(tytTopicsArray5[indeks5!].url3!)}
        if tytTopicsArray5[indeks5!].url4! != "a" {dizi.append(tytTopicsArray5[indeks5!].url4!)}
        if tytTopicsArray5[indeks5!].url5! != "a" {dizi.append(tytTopicsArray5[indeks5!].url5!)}
        if tytTopicsArray5[indeks5!].url6! != "a" {dizi.append(tytTopicsArray5[indeks5!].url6!)}
        if tytTopicsArray5[indeks5!].url7! != "a" {dizi.append(tytTopicsArray5[indeks5!].url7!)}
        if tytTopicsArray5[indeks5!].url8! != "a" {dizi.append(tytTopicsArray5[indeks5!].url8!)}
        if tytTopicsArray5[indeks5!].url9! != "a" {dizi.append(tytTopicsArray5[indeks5!].url9!)}
        if tytTopicsArray5[indeks5!].url10! != "a" {dizi.append(tytTopicsArray5[indeks5!].url10!)}
        
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
 


    @IBAction func backButton(_ sender: Any) { dismiss(animated: false) }
    
}

extension topicDetailsViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return dizi.count}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellx") as! topicDetailsTableViewCell
        let url = dizi[indexPath.row]
         cell.a.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"))
        return cell
    }
}
