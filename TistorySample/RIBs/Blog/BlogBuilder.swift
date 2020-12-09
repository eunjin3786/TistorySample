import RIBs

protocol BlogDependency: Dependency {
    
}

final class BlogComponent: Component<BlogDependency> {
    
}

protocol BlogBuildable: Buildable {
    func build(withListener listener: BlogListener) -> BlogRouting
}

final class BlogBuilder: Builder<BlogDependency>, BlogBuildable {

    override init(dependency: BlogDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: BlogListener) -> BlogRouting {
        let component = BlogComponent(dependency: dependency)
        let viewController = BlogViewController()
        let interactor = BlogInteractor(presenter: viewController)
        interactor.listener = listener
        return BlogRouter(interactor: interactor, viewController: viewController)
    }
}
