import RIBs

protocol OtherBlogInteractable: Interactable {
    var router: OtherBlogRouting? { get set }
    var listener: OtherBlogListener? { get set }
}

protocol OtherBlogViewControllable: ViewControllable {
    
}

final class OtherBlogRouter: Router<OtherBlogInteractable>, OtherBlogRouting {
    
    private let viewController: OtherBlogViewControllable
    
    init(interactor: OtherBlogInteractable, viewController: OtherBlogViewControllable) {
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }
}
