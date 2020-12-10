import RIBs
import RxSwift

enum MyBlogEvent {
    case openSetting
    case openStatistics
}

protocol MyBlogDependency: Dependency {
    var myBlogViewController: MyBlogViewControllable { get }
    var myBlogEventStream: PublishSubject<MyBlogEvent> { get }
}

final class MyBlogComponent: Component<MyBlogDependency> {
    fileprivate var myBlogViewController: MyBlogViewControllable {
        return dependency.myBlogViewController
    }
    
    fileprivate var myBlogEventStream: PublishSubject<MyBlogEvent> {
        return dependency.myBlogEventStream
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
        let interactor = MyBlogInteractor(eventStream: component.myBlogEventStream)
        interactor.listener = listener
        return MyBlogRouter(interactor: interactor, viewController: component.myBlogViewController)
    }
}
