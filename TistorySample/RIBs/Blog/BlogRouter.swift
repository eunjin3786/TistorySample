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
    
    var myBlogRouter: MyBlogRouting?
    
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
        if myBlogRouter == nil {
            let myBlogRouter = myBlogBuilder.build(withListener: interactor)
            self.myBlogRouter = myBlogRouter
            attachChild(myBlogRouter)
        }
    }
    
    func routeToOtherBlog() {
        let otherBlogRouter = otherBlogBuilder.build(withListener: interactor)
        attachChild(otherBlogRouter)
    }
    
    func routeToBlogSetting() {
        
    }
}
