import RIBs

protocol RootDependency: Dependency {
    
}

final class RootComponent: Component<RootDependency> {
    
}

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        _ = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)

        return RootRouter(interactor: interactor,
                          viewController: viewController)
    }
}
