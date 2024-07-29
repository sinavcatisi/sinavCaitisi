import Foundation
import Firebase
import FirebaseFirestore

class LessonContentPageInteractor:PresenterToInteractorLessonContentPageProtocol{
        
    var lessonContentPagePresenterObject: InteractorToPresenterLessonContentPageProtocol?
    
    func getData2(lesson: String) {
        let db = Firestore.firestore()
        let les = lesson
        var topicList = [topics]()
        db.collection(lesson).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
            } else {
                if let documents = querySnapshot?.documents {
                    topicList.removeAll(keepingCapacity: false)
                for document in documents {
                    if let topicName = document.get("topicName") as? String {
                    if let url1 = document.get("url1") as? String{
                        if let url2 = document.get("url2") as? String{
                            if let url3 = document.get("url3") as? String{
                                if let url4 = document.get("url4") as? String{
                                    if let url5 = document.get("url5")  as? String {
                                        if let url6 = document.get("url6")  as? String {
                                            if let url7 = document.get("url7")  as? String {
                                                if let url8 = document.get("url8")  as? String {
                                                    if let url9 = document.get("url9")  as? String {
                                                        if let url10 = document.get("url10")  as? String {
                                                        let topicObject = topics(topicName: topicName, url1: url1, url2: url2, url3: url3, url4: url4, url5: url5, url6: url6, url7: url7, url8: url8, url9: url9, url10: url10)
                                                                    topicList.append(topicObject)
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
                        }
                    }
                }
                self.lessonContentPagePresenterObject?.sendDataToPresenter(topicListInINt: topicList,lesson: les)

            }
        }
    }
}
