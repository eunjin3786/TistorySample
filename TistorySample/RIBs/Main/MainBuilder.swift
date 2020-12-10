import RIBs

protocol MainDependency: Dependency {
    
}

final class MainComponent: Component<MainDependency>, HomeDependency, BlogDependency {

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
        let homeBuilder = HomeBuilder(dependency: component)
        let blogBuilder = BlogBuilder(dependency: component, owner: .me)
        return MainRouter(interactor: interactor,
                          viewController: viewController,
                          homeBuilder: homeBuilder,
                          blogBuilder: blogBuilder)
    }
}
