import RIBs

protocol HomeDependency: Dependency {
    
}

final class HomeComponent: Component<HomeDependency>, BlogDependency {
    
}

protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> HomeRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: HomeListener) -> HomeRouting {
        let component = HomeComponent(dependency: dependency)
        let viewController = HomeViewController()
        let interactor = HomeInteractor(presenter: viewController)
        interactor.listener = listener
        let blogBuilder = BlogBuilder(dependency: component, owner: .other)
        return HomeRouter(interactor: interactor,
                          blogBuilder: blogBuilder,
                          viewController: viewController)
    }
}
