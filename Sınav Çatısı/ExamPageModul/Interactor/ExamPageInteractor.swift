import Foundation
import FirebaseFirestore

class ExamPageInteractor:PresenterToInteractorExamPageProtocol{
    var ExamPagePresenterObject: InteractorToPresenterExamPageProtocol?
    
    func getData2(exam2: String) {
        
            let db = Firestore.firestore()
            var examList = [exam]()
            db.collection(exam2).getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Hata: \(error.localizedDescription)")
                } else {
                    if let documents = querySnapshot?.documents {
                        for document in documents {
                            if let url1 = document.get("url1") as? String {
                                if let url2 = document.get("url2") as? String {
                                    
                                        if let lessonName = document.get("lessonName") as? String {
                                            let ex = exam(lessonName: lessonName, url1: url1, url2: url2)
                                            examList.append(ex)
                                        }
                                    }
                            }
                        }
                        self.ExamPagePresenterObject?.sendDataToPresenter(examListInteractor: examList, exam3: exam2)
                    }
                }
            }
        }
    
    
   
}
