import RIBs

protocol MainInteractable: Interactable, BlogListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    func show(viewController: ViewControllable)
}

final class MainRouter: ViewableRouter<MainInteractable, MainViewControllable>, MainRouting {

    private let blogBuilder: BlogBuildable
    
    init(interactor: MainInteractable,
         viewController: MainViewControllable,
         blogBuilder: BlogBuildable) {
        self.blogBuilder = blogBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToBlog() {
        let blogRouter = blogBuilder.build(withListener: interactor, owner: .other)
        attachChild(blogRouter)
        viewController.show(viewController: blogRouter.viewControllable)
    }
}
