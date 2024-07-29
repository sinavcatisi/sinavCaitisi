import Foundation

class TestPageRouter:PresenterToRouterTestPageProtocols{
    static func createModul(ref: TestMainPageViewController) {
        
        let presenter = TestPagePresenter()
        ref.TestPresenterObject = presenter
        ref.TestPresenterObject?.testInteractorObject = TestPageInteractor()
        ref.TestPresenterObject?.testPageViewObject = ref
        ref.TestPresenterObject?.testInteractorObject?.testPagePresenterObject = presenter
    }
    

}
 
