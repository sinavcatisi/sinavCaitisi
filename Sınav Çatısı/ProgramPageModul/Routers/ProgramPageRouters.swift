import Foundation

class ProgramPageRouters:PresenterToRouterProgramPageProtocols{
 
    static func createModul(ref: ProgramViewController) {
        
        let presenter = ProgramPagePresenter()
        ref.ProgramPresenterObject = presenter
            ref.ProgramPresenterObject?.ProgramInteractorObject = ProgramPageInteractor()
            ref.ProgramPresenterObject?.ProgramPageViewObject = ref
            ref.ProgramPresenterObject?.ProgramInteractorObject?.ProgramPagePresenterObject = presenter
        }

    
}
