import RIBs

protocol PostInteractable: Interactable {
    var router: PostRouting? { get set }
    var listener: PostListener? { get set }
}

protocol PostViewControllable: ViewControllable {
    
}

final class PostRouter: ViewableRouter<PostInteractable, PostViewControllable>, PostRouting {
    
    override init(interactor: PostInteractable, viewController: PostViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
