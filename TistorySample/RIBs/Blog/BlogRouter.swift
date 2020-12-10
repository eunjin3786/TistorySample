import RIBs

protocol BlogInteractable: Interactable, MyBlogListener, OtherBlogListener {
    var router: BlogRouting? { get set }
    var listener: BlogListener? { get set }
}

protocol BlogViewControllable: MyBlogViewControllable, OtherBlogViewControllable {
    
}

final class BlogRouter: ViewableRouter<BlogInteractable, BlogViewControllable>, BlogRouting {

    private let myBlogBuilder: MyBlogBuildable
    private let otherBlogBuilder: OtherBlogBuildable
    
    private let owner: Owner
    
    private var myBlogRouter: MyBlogRouting?
    private var otherBlogRouter: OtherBlogRouting?
    
    init(interactor: BlogInteractable,
         viewController: BlogViewControllable,
         owner: Owner,
         myBlogBuilder: MyBlogBuildable,
         otherBlogBuilder: OtherBlogBuildable) {
        self.owner = owner
        self.myBlogBuilder = myBlogBuilder
        self.otherBlogBuilder = otherBlogBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        switch owner {
        case .me:
            routeToMyBlog()
        case .other:
            routeToOtherBlog()
        }
    }
    
    func routeToMyBlog() {
        if myBlogRouter == nil {
            let myBlogRouter = myBlogBuilder.build(withListener: interactor)
            self.myBlogRouter = myBlogRouter
            attachChild(myBlogRouter)
        }
    }
    
    func routeToOtherBlog() {
        if otherBlogRouter == nil {
            let otherBlogRouter = otherBlogBuilder.build(withListener: interactor)
            attachChild(otherBlogRouter)
        }
    }
}
