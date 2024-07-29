import Foundation


protocol ViewToPresenterProgramPageProtocol{
    
    var ProgramInteractorObject:PresenterToInteractorProgramPageProtocol?{get set}
    var ProgramPageViewObject:PresenterToViewProgramPageProtocol? {get set}
    
    func getData1(pr1:String)
}


protocol PresenterToInteractorProgramPageProtocol{
    
    var ProgramPagePresenterObject:InteractorToPresenterProgramPageProtocol?{get set}
    
    func getData2(pr2:String)
}

protocol InteractorToPresenterProgramPageProtocol{
    
    func sendDataToPresenter(progList1:Array<program>,pr3:String)
}
protocol PresenterToViewProgramPageProtocol{
    
    func sendDataToView(progList2:Array<program>,pr4:String)
}


protocol PresenterToRouterProgramPageProtocols{
    
    static func createModul(ref:ProgramViewController)
}
