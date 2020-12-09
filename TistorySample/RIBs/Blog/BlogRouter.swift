import RIBs

protocol BlogInteractable: Interactable, MyBlogListener, OtherBlogListener {
    var router: BlogRouting? { get set }
    var listener: BlogListener? { get set }
}

protocol BlogViewControllable: ViewControllable, MyBlogViewControllable, OtherBlogViewControllable {
    
}

final class BlogRouter: ViewableRouter<BlogInteractable, BlogViewControllable>, BlogRouting {

    private let myBlogBuilder: MyBlogBuildable
    private let otherBlogBuilder: OtherBlogBuildable
    
    init(interactor: BlogInteractable,
         viewController: BlogViewControllable,
         myBlogBuilder: MyBlogBuildable,
         otherBlogBuilder: OtherBlogBuildable) {
        self.myBlogBuilder = myBlogBuilder
        self.otherBlogBuilder = otherBlogBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    func routeToMyBlog() {
        let myBlogRouter = myBlogBuilder.build(withListener: interactor)
        attachChild(myBlogRouter)
    }
    
    func routeToOtherBlog() {
        let otherBlogRouter = otherBlogBuilder.build(withListener: interactor)
        attachChild(otherBlogRouter)
    }
}
