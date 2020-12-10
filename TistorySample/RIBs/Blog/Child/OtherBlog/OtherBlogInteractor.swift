import RIBs
import RxSwift

protocol OtherBlogRouting: Routing {
    func cleanupViews()
}

protocol OtherBlogListener: class {
    func blogSubscriptionChanged(to isSubscribed: Bool)
    func otherBlogInfoFetched(posts: [String], isSubscribed: Bool)
}

final class OtherBlogInteractor: Interactor, OtherBlogInteractable {

    weak var router: OtherBlogRouting?
    weak var listener: OtherBlogListener?
    
    private let eventStream: PublishSubject<OtherBlogEvent>
    
    private var isSubscribed = false

    init(eventStream: PublishSubject<OtherBlogEvent>) {
        self.eventStream = eventStream
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        eventStream.subscribe(onNext: { event in
            switch event {
            case .toggleSubscription:
                self.isSubscribed.toggle()
                self.listener?.blogSubscriptionChanged(to: self.isSubscribed)
            }
        }).disposeOnDeactivate(interactor: self)

        requestOtherBlogInfo()
    }
    
    private func requestOtherBlogInfo() {
        isSubscribed = false
        let posts = ["다른 사람 글1", "다른 사람 글2"]
        
        listener?.otherBlogInfoFetched(posts: posts, isSubscribed: isSubscribed)
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
