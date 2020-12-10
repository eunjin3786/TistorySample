import RIBs
import RxSwift

protocol MyBlogRouting: Routing {
    func cleanupViews()
    func routeToBlogSetting()
    func routeToBlogStatistics()
}

protocol MyBlogListener: class {
    func myBlogInfoFetched(posts: [String])
}

final class MyBlogInteractor: Interactor, MyBlogInteractable {

    weak var router: MyBlogRouting?
    weak var listener: MyBlogListener?

    private let eventStream: PublishSubject<MyBlogEvent>
    
    init(eventStream: PublishSubject<MyBlogEvent>) {
        self.eventStream = eventStream
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        eventStream.subscribe(onNext: { event in
            switch event {
            case .openSetting:
                self.router?.routeToBlogSetting()
            case .openStatistics:
                self.router?.routeToBlogStatistics()
            }
        }).disposeOnDeactivate(interactor: self)
        
        
        requestMyBlogInfo()
    }
    
    private func requestMyBlogInfo() {
        let posts = ["내 글1", "내 글2"]
        listener?.myBlogInfoFetched(posts: posts)
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
