import RIBs

protocol OtherBlogDependency: Dependency {
    var otherBlogViewController: OtherBlogViewControllable { get }
}

final class OtherBlogComponent: Component<OtherBlogDependency> {
    fileprivate var otherBlogViewController: OtherBlogViewControllable {
        return dependency.otherBlogViewController
    }
}

protocol OtherBlogBuildable: Buildable {
    func build(withListener listener: OtherBlogListener) -> OtherBlogRouting
}

final class OtherBlogBuilder: Builder<OtherBlogDependency>, OtherBlogBuildable {

    override init(dependency: OtherBlogDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OtherBlogListener) -> OtherBlogRouting {
        let component = OtherBlogComponent(dependency: dependency)
        let interactor = OtherBlogInteractor()
        interactor.listener = listener
        return OtherBlogRouter(interactor: interactor, viewController: component.otherBlogViewController)
    }
}
