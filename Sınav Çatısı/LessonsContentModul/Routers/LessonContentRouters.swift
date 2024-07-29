import Foundation

class LessonContentPageRouter:PresenterToRouterLessonContentPageProtocols{
    static func createModul(ref: LessonContentViewController) {
        
        let presenter = LessonContentPagePresenter()
        ref.LessonContentPresenterObject = presenter
        ref.LessonContentPresenterObject?.LessonContentInteractorObject = LessonContentPageInteractor()
        ref.LessonContentPresenterObject?.LessonContentPageViewObject = ref
        ref.LessonContentPresenterObject?.LessonContentInteractorObject?.lessonContentPagePresenterObject = presenter
    }
    

}
