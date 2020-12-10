import RIBs
import RxSwift

enum Owner {
    case me
    case other
}

protocol BlogDependency: Dependency {

}

final class BlogComponent: Component<BlogDependency>, MyBlogDependency, OtherBlogDependency {
    
    var myBlogViewController: MyBlogViewControllable {
        return viewController
    }
    
    var otherBlogViewController: OtherBlogViewControllable {
        return viewController
    }
    
    let owner: Owner
    let viewController: BlogViewControllable
    
    let myBlogEventStream = PublishSubject<MyBlogEvent>()
    let otherBlogEventStream = PublishSubject<OtherBlogEvent>()
    
    init(dependency: BlogDependency, owner: Owner, viewController: BlogViewControllable) {
        self.owner = owner
        self.viewController = viewController
        super.init(dependency: dependency)
    }
}

protocol BlogBuildable: Buildable {
    func build(withListener listener: BlogListener, owner: Owner) -> BlogRouting
}

final class BlogBuilder: Builder<BlogDependency>, BlogBuildable {

    override init(dependency: BlogDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: BlogListener, owner: Owner) -> BlogRouting {
        let viewController = BlogViewController()
        let component = BlogComponent(dependency: dependency, owner: owner, viewController: viewController)
        let interactor = BlogInteractor(presenter: viewController,
                                        myBlogEventStream: component.myBlogEventStream,
                                        otherBlogEventStream: component.otherBlogEventStream)
        interactor.listener = listener
        let myBlogBuilder = MyBlogBuilder(dependency: component)
        let otherBlogBuilder = OtherBlogBuilder(dependency: component)
        return BlogRouter(interactor: interactor,
                          viewController: viewController,
                          owner: owner,
                          myBlogBuilder: myBlogBuilder,
                          otherBlogBuilder: otherBlogBuilder)
    }
}
