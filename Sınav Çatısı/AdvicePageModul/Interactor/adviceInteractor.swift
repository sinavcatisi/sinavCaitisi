import Foundation
import FirebaseFirestore

class AdvicePageInteractor:PresenterToInteractorAdvicePageProtocol{
   
    

    var AdvicePagePresenterObject: InteractorToPresenterAdvicePageProtocol?
    var urlArray = [String]()
   
    func getData2(advice1: String, AdviceList2: Array<String>) {
        let db = Firestore.firestore()
        
        db.collection(advice1).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
            } else {
                if let documents = querySnapshot?.documents {
                    for document in documents {
                        if let id = document.get("id") as? Int {
                            if let url1 = document.get("url1") as? String {
                                if let url2 = document.get("url2") as? String {
                                     let adv = advice(id: id, url1: url1,url2: url2)
                                    self.urlArray = [adv.url1 ?? "", adv.url2 ?? ""]
                                    print("???\(self.urlArray[1])")
                                    
                                }
                            }
                        }
                    }
                    
                    self.AdvicePagePresenterObject?.sendDataToPresenter(AdviceListInteractor: self.urlArray, Advice3: advice1)
                }
            }
        }
    }
  
    
    
    
    
}

