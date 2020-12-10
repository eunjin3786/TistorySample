import RIBs

protocol RootInteractable: Interactable, MainListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable, animated: Bool)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let mainBuilder: MainBuildable
    
    init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  mainBuilder: MainBuildable) {
        self.mainBuilder = mainBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToMain() {
        let mainRouter = mainBuilder.build(withListener: interactor)
        attachChild(mainRouter)
        let navigationController = UINavigationController(root: mainRouter.viewControllable)
        viewController.present(viewController: navigationController, animated: false)
    }
}
