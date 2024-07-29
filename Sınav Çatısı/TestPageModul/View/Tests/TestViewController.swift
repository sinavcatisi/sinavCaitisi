import UIKit
import FirebaseFirestore

class TestViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var array1: [test]?
    var array2: [test]?
    var array3: [test]?
    var nameArray:[String]?
    var Imageurl:[String]?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        design()
     
        
        if array3![0].s1 != "a"{
            nameArray = [array1![0].s1,array2![0].s1,array3![0].s1]
            Imageurl =  [array1![0].s2,array2![0].s2,array3![0].s2]
        }else{
            if array2![0].s1 != "a"{
            nameArray = [array1![0].s1,array2![0].s1]
            Imageurl = [array1![0].s2,array2![0].s2]
            }else{
                if array1![0].s1 != "a"{
                    nameArray = [array1![0].s1]
                    Imageurl = [array1![0].s2]
                }
                else{
                    nameArray = []
                    Imageurl = []
                }
            }
        }
        
        
    }
    func design(){
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.collectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        design.itemSize = CGSize(width: (width-80)/2, height: (width-90)/2)
        design.minimumInteritemSpacing = 20
        design.minimumLineSpacing = 30
        collectionView.collectionViewLayout = design
    }
    
    @IBAction func backButton(_ sender: Any) {dismiss(animated: false)}
    
}



extension TestViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return nameArray!.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! TestsCollectionViewCell
        cell.label.text = nameArray![indexPath.row]
        cell.image.sd_setImage(with: URL(string: (Imageurl?[indexPath.row])!))
        cell.contentView.layer.cornerRadius = 30
        cell.contentView.layer.borderWidth = 2
        cell.contentView.layer.borderColor = CGColor(gray: 1, alpha: 0.6)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { performSegue(withIdentifier: "toTestDetails", sender: indexPath.row)}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let row = sender as? Int
        if segue.identifier == "toTestDetails" {
            let gidilecekVC = segue.destination as! TestDetailsViewController
            if row == 0{gidilecekVC.arr1 = array1! }
            else if row == 1{ gidilecekVC.arr1 = array2!}
            else if row == 2{ gidilecekVC.arr1 = array3!}
        }
    }

}
