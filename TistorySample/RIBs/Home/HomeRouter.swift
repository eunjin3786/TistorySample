import RIBs

protocol HomeInteractable: Interactable, BlogListener {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
    func push(viewController: ViewControllable)
}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRouting {

    private let blogBuilder: BlogBuildable
    
    init(interactor: HomeInteractable,
         blogBuilder: BlogBuildable,
         viewController: HomeViewControllable) {
        self.blogBuilder = blogBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToOtherBlog() {
        let blogRouter = blogBuilder.build(withListener: interactor)
        attachChild(blogRouter)
        viewController.push(viewController: blogRouter.viewControllable)
    }
}
