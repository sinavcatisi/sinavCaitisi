
import Foundation

protocol ViewToPresenterTestPageProtocol{
    var testInteractorObject:PresenterToInteractorTestPageProtocol?{get set}
    var testPageViewObject:PresenterToViewTestPageProtocol? {get set}
    func getData1(test1:String)
  
}

protocol PresenterToInteractorTestPageProtocol{
    var testPagePresenterObject:InteractorToPresenterTestPageProtocol?{get set}
    func getData2(test2:String)
   
}

protocol InteractorToPresenterTestPageProtocol{
    func sendDataToPresenter(testListInteractor:Array<test>,test3:String)
   
}
protocol PresenterToViewTestPageProtocol{
    func sendDataToView(testListPresenter:Array<test>,test4:String)
  
}

protocol PresenterToRouterTestPageProtocols{
    static func createModul(ref:TestMainPageViewController)
}

