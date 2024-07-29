import Foundation

class LessonContentPagePresenter: ViewToPresenterLessonContentPageProtocol{
   
    var LessonContentPageViewObject: PresenterToViewLessonContentPageProtocol?
    var LessonContentInteractorObject: PresenterToInteractorLessonContentPageProtocol?
    
    func getData1(lesson: String) {
        LessonContentInteractorObject?.getData2(lesson: lesson)
    }  
}

extension LessonContentPagePresenter: InteractorToPresenterLessonContentPageProtocol{
    func sendDataToPresenter(topicListInINt: Array<topics>, lesson: String) {
        LessonContentPageViewObject?.sendDataToView(topicListInPresenter: topicListInINt,lesson: lesson)
       
    }
    
   
}
