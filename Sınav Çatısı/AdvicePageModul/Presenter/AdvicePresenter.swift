import Foundation



class AdvicePagePresenter: ViewToPresenterAdvicePageProtocol{
 
    
    
    var adviceInteractorObject: PresenterToInteractorAdvicePageProtocol?
    var AdvicePageViewObject: PresenterToViewAdvicePageProtocol?
    
    
    func getData1(advice: String, AdviceList: Array<String>) {
        adviceInteractorObject?.getData2(advice1: advice,AdviceList2: AdviceList)

    }
    
}


extension AdvicePagePresenter:InteractorToPresenterAdvicePageProtocol{
    func sendDataToPresenter(AdviceListInteractor: Array<String>, Advice3: String) {
        AdvicePageViewObject?.sendDataToView(AdviceListPresenter:AdviceListInteractor, Advice4: Advice3)
        print(AdviceListInteractor[1])
    }
    
    
  
    
    
    
    
    
}

