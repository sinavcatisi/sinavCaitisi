
import Foundation
import Foundation

protocol ViewToPresenterExamPageProtocol{
    var ExamInteractorObject:PresenterToInteractorExamPageProtocol?{get set}
    var ExamPageViewObject:PresenterToViewExamPageProtocol? {get set}
    func getData1(exam1:String)
}

protocol PresenterToInteractorExamPageProtocol{
    var ExamPagePresenterObject:InteractorToPresenterExamPageProtocol?{get set}
    func getData2(exam2:String)
}

protocol InteractorToPresenterExamPageProtocol{
    
    func sendDataToPresenter(examListInteractor:Array<exam>,exam3:String)
}
protocol PresenterToViewExamPageProtocol{
    
    func sendDataToView(examListPresenter:Array<exam>,exam4:String)
}

protocol PresenterToRouterExamPageProtocols{
    
    static func createModul(ref:examMainPageViewController)
}

