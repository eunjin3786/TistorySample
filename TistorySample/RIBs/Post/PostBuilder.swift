import RIBs

protocol PostDependency: Dependency {
    
}

final class PostComponent: Component<PostDependency> {
    
}

protocol PostBuildable: Buildable {
    func build(withListener listener: PostListener) -> PostRouting
}

final class PostBuilder: Builder<PostDependency>, PostBuildable {

    override init(dependency: PostDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: PostListener) -> PostRouting {
        let component = PostComponent(dependency: dependency)
        let viewController = PostViewController()
        let interactor = PostInteractor(presenter: viewController)
        interactor.listener = listener
        return PostRouter(interactor: interactor, viewController: viewController)
    }
}
