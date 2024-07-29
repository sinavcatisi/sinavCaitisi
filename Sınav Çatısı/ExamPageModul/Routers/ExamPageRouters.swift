import Foundation

class ExamPageRouter:PresenterToRouterExamPageProtocols{
    static func createModul(ref: examMainPageViewController) {
        
        let presenter = ExamPagePresenter()
        ref.ExamPresenterObject = presenter
        ref.ExamPresenterObject?.ExamInteractorObject = ExamPageInteractor()
        ref.ExamPresenterObject?.ExamPageViewObject = ref
        ref.ExamPresenterObject?.ExamInteractorObject?.ExamPagePresenterObject = presenter
    }
    

}

