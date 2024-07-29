import Foundation
import FirebaseFirestore

class ProgramPageInteractor: PresenterToInteractorProgramPageProtocol{
   
    var ProgramPagePresenterObject: InteractorToPresenterProgramPageProtocol?

    func getData2(pr2:String) {
        let db = Firestore.firestore()
        var progList = [program]()
        db.collection(pr2).order(by: "week", descending: false).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
            } else {
                if let documents = querySnapshot?.documents {
                    for document in documents {
                            if let url1 = document.get("url1") as? String {
                                if let url2 = document.get("url2") as? String {
                                    if let week = document.get("week") as? Int {
                                        if let url3 = document.get("url3") as? String {
                                            if let url4 = document.get("url4") as? String {
                                                if let url5 = document.get("url5") as? String {
                                                    if let url6 = document.get("url6") as? String {
                                                        if let url7 = document.get("url7") as? String {
                                                            if let url8 = document.get("url8") as? String {
                                                                
                                                                let prog = program(week: week, url1: url1, url2: url2, url3: url3 , url4: url4, url5: url5, url6: url6, url7: url7, url8: url8)
                                                                
                                                                
                                                                 progList.append(prog)
                                                                
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                }
                            }
                        }
                    }
                    self.ProgramPagePresenterObject?.sendDataToPresenter(progList1: progList, pr3: pr2)
                }
            }
        }
    }

}
