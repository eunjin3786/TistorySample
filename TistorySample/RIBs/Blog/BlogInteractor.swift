import RIBs
import RxSwift

protocol BlogRouting: ViewableRouting {
    func routeToMyBlog()
    func routeToOtherBlog()
}

protocol BlogPresentable: Presentable {
    var listener: BlogPresentableListener? { get set }
    func showMyBlog(with posts: [String])
    func showOtherBlog(with posts: [String], isSubscribed: Bool)
    func toggleSubscription(to isSubscribed: Bool)
}

protocol BlogListener: class {
    
}

final class BlogInteractor: PresentableInteractor<BlogPresentable>, BlogInteractable {

    weak var router: BlogRouting?
    weak var listener: BlogListener?
    
    private let myBlogEventStream: PublishSubject<MyBlogEvent>
    private let otherBlogEventStream: PublishSubject<OtherBlogEvent>

    init(presenter: BlogPresentable,
         myBlogEventStream: PublishSubject<MyBlogEvent>,
         otherBlogEventStream: PublishSubject<OtherBlogEvent>) {
        self.myBlogEventStream = myBlogEventStream
        self.otherBlogEventStream = otherBlogEventStream
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    // MARK: - MyBlogListener
    func myBlogInfoFetched(posts: [String]) {
        presenter.showMyBlog(with: posts)
    }
    
    // MARK: - OtherBlogListener
    func otherBlogInfoFetched(posts: [String], isSubscribed: Bool) {
        presenter.showOtherBlog(with: posts, isSubscribed: isSubscribed)
    }
    
    func blogSubscriptionChanged(to isSubscribed: Bool) {
        presenter.toggleSubscription(to: isSubscribed)
    }
}

extension BlogInteractor: BlogPresentableListener {

    func blogSettingButtonDidTap() {
        myBlogEventStream.onNext(.openSetting)
    }
    
    func blogSubscriptionToggled() {
        otherBlogEventStream.onNext(.toggleSubscription)
    }
}
