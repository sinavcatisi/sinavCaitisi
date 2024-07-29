import UIKit
import FirebaseFirestore
import SDWebImage
import GoogleMobileAds

class adviceViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var tableView1: UITableView!
    var bannerView: GADBannerView!
    var urlArrayView = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4420220643754704/8082791221"
        //bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"  // test
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self

        tableView1.dataSource = self
        tableView1.delegate = self

    }


    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false)
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


extension adviceViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return urlArrayView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView1.dequeueReusableCell(withIdentifier: "adviceCell") as! adviceTableViewCell
        cell.gorsel.sd_setImage(with: URL(string: self.urlArrayView[indexPath.row]))
        return cell
    }
    
}
