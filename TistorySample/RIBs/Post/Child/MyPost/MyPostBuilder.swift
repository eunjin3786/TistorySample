import RIBs

protocol MyPostDependency: Dependency {
    var MyPostViewController: MyPostViewControllable { get }
}

final class MyPostComponent: Component<MyPostDependency> {

    fileprivate var MyPostViewController: MyPostViewControllable {
        return dependency.MyPostViewController
    }
}

protocol MyPostBuildable: Buildable {
    func build(withListener listener: MyPostListener) -> MyPostRouting
}

final class MyPostBuilder: Builder<MyPostDependency>, MyPostBuildable {

    override init(dependency: MyPostDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MyPostListener) -> MyPostRouting {
        let component = MyPostComponent(dependency: dependency)
        let interactor = MyPostInteractor()
        interactor.listener = listener
        return MyPostRouter(interactor: interactor, viewController: component.MyPostViewController)
    }
}
