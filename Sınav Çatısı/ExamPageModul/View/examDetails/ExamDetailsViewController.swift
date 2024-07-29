import UIKit
import GoogleMobileAds
class ExamDetailsViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var image: UIImageView!
    var bannerView: GADBannerView!
    var examObject = exam()

    override func viewDidLoad() {
        super.viewDidLoad()

        image.sd_setImage(with: URL(string: examObject.url1!) )
        segmented.selectedSegmentIndex = 0
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-4420220643754704/6678457634"
       // bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"  // test
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
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

    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: false)
    }
    @IBAction func segmented(_ sender: Any) {
        switch segmented.selectedSegmentIndex {
        case 0:  image.sd_setImage(with: URL(string: examObject.url1!) )
        case 1:  image.sd_setImage(with: URL(string: examObject.url2!) )
        default:  break
        }
    }

}
