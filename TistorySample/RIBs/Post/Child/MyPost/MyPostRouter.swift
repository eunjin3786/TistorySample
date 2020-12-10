import RIBs

protocol MyPostInteractable: Interactable {
    var router: MyPostRouting? { get set }
    var listener: MyPostListener? { get set }
}

protocol MyPostViewControllable: ViewControllable {
    
}

final class MyPostRouter: Router<MyPostInteractable>, MyPostRouting {

    init(interactor: MyPostInteractable, viewController: MyPostViewControllable) {
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        
    }
    
    private let viewController: MyPostViewControllable
}
