import RIBs

protocol MainDependency: Dependency {
    
}

final class MainComponent: Component<MainDependency>, BlogDependency {
    
}

protocol MainBuildable: Buildable {
    func build(withListener listener: MainListener) -> MainRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MainListener) -> MainRouting {
        let component = MainComponent(dependency: dependency)
        let viewController = MainViewController()
        let interactor = MainInteractor(presenter: viewController)
        interactor.listener = listener
        let blogBuilder = BlogBuilder(dependency: component)
        return MainRouter(interactor: interactor,
                          viewController: viewController,
                          blogBuilder: blogBuilder)
    }
}
