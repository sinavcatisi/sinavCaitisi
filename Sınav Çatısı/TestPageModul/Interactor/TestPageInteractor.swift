import Foundation
import FirebaseFirestore

class TestPageInteractor:PresenterToInteractorTestPageProtocol{
  
    var testPagePresenterObject: InteractorToPresenterTestPageProtocol?
    
    func getData2(test2: String) {
        let db = Firestore.firestore()
        var cardsList = [test]()
        db.collection(test2).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
            } else {
                if let documents = querySnapshot?.documents {
                    for document in documents {
                        if let select1 = document.get("s1") as? String {
                            if let select2 = document.get("s2") as? String {
                                if let select3 = document.get("s3") as? String {
                                    if let select4 = document.get("s4") as? String {
                                        if let question = document.get("q") as? String {
                                            if let trueSelect = document.get("true") as? String {
                                                let c = test(question: question, select1: select1, select2: select2, select3: select3, select4: select4, trueSelect: trueSelect)
                                            cardsList.append(c)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    self.testPagePresenterObject?.sendDataToPresenter(testListInteractor: cardsList, test3: test2)
                }
            }
        }
    }
}
