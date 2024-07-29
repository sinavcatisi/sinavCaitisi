import Foundation

protocol ViewToPresenterLessonContentPageProtocol{
    var LessonContentInteractorObject:PresenterToInteractorLessonContentPageProtocol?{get set}
    var LessonContentPageViewObject:PresenterToViewLessonContentPageProtocol? {get set}
    func getData1(lesson:String)
}

protocol PresenterToInteractorLessonContentPageProtocol{
    var lessonContentPagePresenterObject:InteractorToPresenterLessonContentPageProtocol?{get set}
    func getData2(lesson:String)
}

protocol InteractorToPresenterLessonContentPageProtocol{
    
    func sendDataToPresenter(topicListInINt:Array<topics>,lesson:String)
}
protocol PresenterToViewLessonContentPageProtocol{
    
    func sendDataToView(topicListInPresenter:Array<topics>,lesson:String)
}

protocol PresenterToRouterLessonContentPageProtocols{
    
    static func createModul(ref:LessonContentViewController)
}

