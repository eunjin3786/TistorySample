import RIBs

protocol OtherPostInteractable: Interactable {
    var router: OtherPostRouting? { get set }
    var listener: OtherPostListener? { get set }
}

protocol OtherPostViewControllable: ViewControllable {
    
}

final class OtherPostRouter: Router<OtherPostInteractable>, OtherPostRouting {

    init(interactor: OtherPostInteractable, viewController: OtherPostViewControllable) {
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        
    }
    
    private let viewController: OtherPostViewControllable
}
