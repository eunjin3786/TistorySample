import RIBs

protocol OtherPostDependency: Dependency {
    var OtherPostViewController: OtherPostViewControllable { get }
}

final class OtherPostComponent: Component<OtherPostDependency> {

    fileprivate var OtherPostViewController: OtherPostViewControllable {
        return dependency.OtherPostViewController
    }
}

protocol OtherPostBuildable: Buildable {
    func build(withListener listener: OtherPostListener) -> OtherPostRouting
}

final class OtherPostBuilder: Builder<OtherPostDependency>, OtherPostBuildable {

    override init(dependency: OtherPostDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OtherPostListener) -> OtherPostRouting {
        let component = OtherPostComponent(dependency: dependency)
        let interactor = OtherPostInteractor()
        interactor.listener = listener
        return OtherPostRouter(interactor: interactor, viewController: component.OtherPostViewController)
    }
}
