import UIKit
import FirebaseFirestore

class ProgramViewController: UIViewController {
    var ProgramPresenterObject:ViewToPresenterProgramPageProtocol?

    @IBOutlet weak var collectionView: UICollectionView!
    var progSay = [program]()
    var progSoz = [program]()
    var progEa  = [program]()
    var progDil = [program]()
    var progTyt = [program]()
    var progImage = [UIImageView]()
    var programs = [String]()
    var programName = [String]()
    var tytWeeks = [String]()
    var Weeks1 = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgramPageRouters.createModul(ref: self)
        collectionView.delegate = self
        collectionView.dataSource = self
        design()
      //  collectionView.isUserInteractionEnabled = false
        programName = [ "Sayısal","Sözel","Eşit Ağırlık","Dil","Temel Yeterlilik"]
        programs = [ "ProgramSay","ProgramSoz","ProgramEa","ProgramDil","ProgramTyt"]
        for item in programs{ ProgramPresenterObject?.getData1(pr1: item)}
        
        tytWeeks = ["1.Hafta","2.Hafta","3.Hafta","4.Hafta","5.Hafta","6.Hafta","7.Hafta","8.Hafta","9.Hafta","10.Hafta","11.Hafta","12.Hafta","13.Hafta","14.Hafta","15.Hafta","16.Hafta"]
        Weeks1 = ["1.Hafta","2.Hafta","3.Hafta","4.Hafta","5.Hafta","6.Hafta","7.Hafta","8.Hafta","9.Hafta","10.Hafta","11.Hafta","12.Hafta","13.Hafta","14.Hafta","15.Hafta","16.Hafta","17.Hafta","18.Hafta","19.Hafta","20.Hafta","21.Hafta","22.Hafta","23.Hafta","24.Hafta","25.Hafta","26.Hafta"]
       
       
        let say = UIImageView(image: UIImage(named: "say"))
        let soz = UIImageView(image: UIImage(named: "soz"))
        let ea = UIImageView(image: UIImage(named: "ea"))
        let tyt = UIImageView(image: UIImage(named: "tyt"))
        let dil = UIImageView(image: UIImage(named: "dil"))
        progImage.append(say)
        progImage.append(soz)
        progImage.append(ea)
        progImage.append(dil)
        progImage.append(tyt)
      collectionView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.collectionView.isUserInteractionEnabled = true
           }
       
       
    }
 
    func design(){
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.collectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        design.itemSize = CGSize(width: (width-120)/2, height: (width-120)/2)
        design.minimumInteritemSpacing = 30
        design.minimumLineSpacing = 30
        collectionView.collectionViewLayout = design
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {dismiss(animated: false)}
   
}


extension ProgramViewController:PresenterToViewProgramPageProtocol{
    func sendDataToView(progList2: Array<program>, pr4: String) {
        if pr4 == "ProgramSay"{
            progSay = progList2
        }else if pr4 == "ProgramSoz"{
            progSoz = progList2
        }else if pr4 == "ProgramDil"{
            progDil = progList2
        }else if pr4 == "ProgramEa"{
            progEa = progList2
        }else if pr4 == "ProgramTyt"{
            progTyt = progList2
        }
    }
}




extension ProgramViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return progImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "progCell", for: indexPath) as! ProgramCollectionViewCell
        
        cell.image.image = progImage[indexPath.row].image
        cell.layer.cornerRadius = 30
        cell.layer.borderWidth = 0.5
        cell.layer .masksToBounds = true
        cell.label.text = programName[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toProgramDetails", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let row = sender as! Int
       
        
        if segue.identifier == "toProgramDetails" {
            let gidilecekVC = segue.destination as! ProgramDetailsViewController
            
            switch row{
            case 0: gidilecekVC.programArray = progSay
                gidilecekVC.weeks = Weeks1
            case 1: gidilecekVC.programArray = progSoz
                gidilecekVC.weeks = Weeks1
            case 2: gidilecekVC.programArray = progEa
                gidilecekVC.weeks = Weeks1
            case 3: gidilecekVC.programArray = progDil
                gidilecekVC.weeks = Weeks1
            case 4: gidilecekVC.programArray = progTyt
                gidilecekVC.weeks = tytWeeks
            default: gidilecekVC.programArray = progSay
                
            }
            
        }
        
        
    }
}



/*
 func performYourTask() {
     DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
         self.activityIndicator.stopAnimating()
         self.collectionView.isUserInteractionEnabled = true
         self.activityIndicator.isHidden = true
     }
 }
 */
