import RIBs

protocol MyBlogDependency: Dependency {
    var myBlogViewController: MyBlogViewControllable { get }
}

final class MyBlogComponent: Component<MyBlogDependency> {
    fileprivate var myBlogViewController: MyBlogViewControllable {
        return dependency.myBlogViewController
    }
}

protocol MyBlogBuildable: Buildable {
    func build(withListener listener: MyBlogListener) -> MyBlogRouting
}

final class MyBlogBuilder: Builder<MyBlogDependency>, MyBlogBuildable {

    override init(dependency: MyBlogDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MyBlogListener) -> MyBlogRouting {
        let component = MyBlogComponent(dependency: dependency)
        let interactor = MyBlogInteractor()
        interactor.listener = listener
        return MyBlogRouter(interactor: interactor, viewController: component.myBlogViewController)
    }
}
