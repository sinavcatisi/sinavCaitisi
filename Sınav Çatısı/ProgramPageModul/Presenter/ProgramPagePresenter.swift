import Foundation

class ProgramPagePresenter:ViewToPresenterProgramPageProtocol{
    
    var ProgramInteractorObject: PresenterToInteractorProgramPageProtocol?
    var ProgramPageViewObject: PresenterToViewProgramPageProtocol?
    
    func getData1(pr1: String) {
        ProgramInteractorObject?.getData2(pr2: pr1)
    }

}

extension ProgramPagePresenter: InteractorToPresenterProgramPageProtocol{
    
    func sendDataToPresenter(progList1: Array<program>, pr3: String) {
        ProgramPageViewObject?.sendDataToView(progList2: progList1,pr4: pr3)
        
    }
}
