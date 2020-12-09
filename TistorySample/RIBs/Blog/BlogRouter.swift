import RIBs

protocol BlogInteractable: Interactable {
    var router: BlogRouting? { get set }
    var listener: BlogListener? { get set }
}

protocol BlogViewControllable: ViewControllable {
    
}

final class BlogRouter: ViewableRouter<BlogInteractable, BlogViewControllable>, BlogRouting {
    
    override init(interactor: BlogInteractable, viewController: BlogViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
