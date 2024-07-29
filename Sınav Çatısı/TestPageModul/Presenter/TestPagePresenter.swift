import Foundation

class TestPagePresenter: ViewToPresenterTestPageProtocol{
    
    var testInteractorObject: PresenterToInteractorTestPageProtocol?
    var testPageViewObject: PresenterToViewTestPageProtocol?
    
    func getData1(test1: String) {
        testInteractorObject?.getData2(test2: test1)
    }
    
}


extension TestPagePresenter:InteractorToPresenterTestPageProtocol{
    
    func sendDataToPresenter(testListInteractor: Array<test>, test3: String) {
        testPageViewObject?.sendDataToView(testListPresenter: testListInteractor, test4: test3)
       
    }
    
}
