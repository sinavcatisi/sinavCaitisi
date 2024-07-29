import Foundation

class ExamPagePresenter: ViewToPresenterExamPageProtocol{
   
    var ExamInteractorObject: PresenterToInteractorExamPageProtocol?
    var ExamPageViewObject: PresenterToViewExamPageProtocol?
    
    func getData1(exam1: String) {
        ExamInteractorObject?.getData2(exam2: exam1)
    }
   
}

extension ExamPagePresenter: InteractorToPresenterExamPageProtocol{
    
    func sendDataToPresenter(examListInteractor: Array<exam>, exam3: String) {
        ExamPageViewObject?.sendDataToView(examListPresenter: examListInteractor, exam4: exam3)
    }
    
}
    
   

