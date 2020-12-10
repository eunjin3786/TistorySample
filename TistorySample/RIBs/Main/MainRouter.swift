import RIBs

protocol MainInteractable: Interactable, HomeListener, BlogListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    func show(viewController: ViewControllable)
    func hide(viewController: ViewControllable)
}

final class MainRouter: ViewableRouter<MainInteractable, MainViewControllable>, MainRouting {

    private let homeBuilder: HomeBuildable
    private let blogBuilder: BlogBuildable
    
    private let homeRouter: HomeRouting
    private var blogRouter: BlogRouting
    
    init(interactor: MainInteractable,
         viewController: MainViewControllable,
         homeBuilder: HomeBuildable,
         blogBuilder: BlogBuildable) {
        self.homeBuilder = homeBuilder
        self.blogBuilder = blogBuilder
        self.homeRouter = homeBuilder.build(withListener: interactor)
        self.blogRouter = blogBuilder.build(withListener: interactor)
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToHome() {
        detachChildren()
        
        attachChild(homeRouter)
        viewController.show(viewController: homeRouter.viewControllable)
    }
    
    func routeToBlog() {
        detachChildren()
        
        attachChild(blogRouter)
        viewController.show(viewController: blogRouter.viewControllable)
    }
    
    private func detachChildren() {
        self.children.forEach { router in
            detachChild(router)
            if let viewableRouter = router as? ViewableRouting {
                viewController.hide(viewController: viewableRouter.viewControllable)
            }
        }
    }
}
