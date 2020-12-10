import RIBs

protocol MyBlogInteractable: Interactable {
    var router: MyBlogRouting? { get set }
    var listener: MyBlogListener? { get set }
}

protocol MyBlogViewControllable: ViewControllable {

}

final class MyBlogRouter: Router<MyBlogInteractable>, MyBlogRouting {

    private let viewController: MyBlogViewControllable
    
    init(interactor: MyBlogInteractable, viewController: MyBlogViewControllable) {
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    func cleanupViews() {
        
    }
    
    func routeToBlogSetting() {
        
    }
    
    func routeToBlogStatistics() {
        
    }
}
