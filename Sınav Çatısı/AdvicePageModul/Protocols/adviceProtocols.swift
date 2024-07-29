
import Foundation

protocol ViewToPresenterAdvicePageProtocol{
    var adviceInteractorObject:PresenterToInteractorAdvicePageProtocol?{get set}
    var AdvicePageViewObject:PresenterToViewAdvicePageProtocol? {get set}
    func getData1(advice:String,AdviceList:Array<String>)
  
}

protocol PresenterToInteractorAdvicePageProtocol{
    var AdvicePagePresenterObject:InteractorToPresenterAdvicePageProtocol?{get set}
    func getData2(advice1:String,AdviceList2:Array<String>)
   
}

protocol InteractorToPresenterAdvicePageProtocol{
    
    func sendDataToPresenter(AdviceListInteractor:Array<String>,Advice3:String)
   
}
protocol PresenterToViewAdvicePageProtocol{
    
    func sendDataToView(AdviceListPresenter:Array<String>,Advice4:String)
  
}

protocol PresenterToRouterAdvicePageProtocols{
    
    static func createModul(ref:adviceViewController)
}


