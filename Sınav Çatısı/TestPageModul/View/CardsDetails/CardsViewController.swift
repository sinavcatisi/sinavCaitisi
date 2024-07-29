import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var bool: UILabel!
    @IBOutlet weak var s1o: UIButton!
    @IBOutlet weak var s2o: UIButton!
    
    var arr1 = [cards]()

    var sayi = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
      // s1o.titleLabel?.text = dizi[0].select1
      // s2o.titleLabel?.text = dizi[0].select2
    
        
        print(arr1.count)
        
    }
    func compare(sel1:String,sel2:String,bool:Bool){
        
        if bool == true{
            
            s1o.backgroundColor = .blue
            s2o.backgroundColor = .red
            self.s1o.setTitle(self.arr1[self.sayi].s1, for: .normal)
            self.s2o.setTitle(self.arr1[self.sayi].s2, for: .normal)
          
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.s1o.setTitle(self.arr1[self.sayi].s1, for: .normal)
                self.s2o.setTitle(self.arr1[self.sayi].s2, for: .normal)
                self.s1o.backgroundColor = .white
                self.s2o.backgroundColor = .white
               
                self.bool.text = ""
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                
                if self.sayi == self.arr1.count-1{
                    self.s1o.isHidden = true
                    self.s2o.isHidden = true
                    
                    self.bool.text = "test bitti"
                    self.bool.textColor = .red
                }
            }
        }
        if bool == false{
            
            s1o.backgroundColor = .red
            s2o.backgroundColor = .blue
          
            self.s1o.setTitle(self.arr1[self.sayi].s1, for: .normal)
            self.s2o.setTitle(self.arr1[self.sayi].s2, for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.s1o.setTitle(self.arr1[self.sayi].s1, for: .normal)
                self.s2o.setTitle(self.arr1[self.sayi].s2, for: .normal)
                self.s1o.backgroundColor = .white
                self.s2o.backgroundColor = .white
               
                
                self.bool.text = ""
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                
                if self.sayi == self.arr1.count-1{
                    self.s1o.isHidden = true
                    self.s2o.isHidden = true
                    self.bool.text = "test bitti"
                    self.bool.textColor = .red
                }
            }
        }
    }

   
    @IBAction func s1(_ sender: Any) {
     //   compare(sel1: arr1[sayi].select1, sel2: arr1[sayi].select2, bool: arr1[sayi].bool1)
        if sayi != arr1.count-1{sayi += 1}
    }
    
    @IBAction func s2(_ sender: Any) {
     //   compare(sel1: arr1[sayi].select1, sel2: arr1[sayi].select2, bool: arr1[sayi].bool1)
        if sayi != arr1.count-1{sayi += 1}
    }
    
    @IBAction func backButton(_ sender: Any) {
        print(sayi)
        dismiss(animated: false)
        sayi = 0
    }
}
