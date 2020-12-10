import RIBs
import RxSwift

protocol BlogRouting: ViewableRouting {

}

protocol BlogPresentable: Presentable {
    var listener: BlogPresentableListener? { get set }
    func showMyBlog()
    func showOtherBlog(isSubscribed: Bool)
    func toggleSubscription(to isSubscribed: Bool)
}

protocol BlogListener: class {
    
}

final class BlogInteractor: PresentableInteractor<BlogPresentable>, BlogInteractable {

    weak var router: BlogRouting?
    weak var listener: BlogListener?
    
    private let myBlogEventStream: PublishSubject<MyBlogEvent>
    private let otherBlogEventStream: PublishSubject<OtherBlogEvent>
    
    var posts: [String] = []
    
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
        self.posts = posts
        presenter.showMyBlog()
    }
    
    // MARK: - OtherBlogListener
    func otherBlogInfoFetched(posts: [String], isSubscribed: Bool) {
        self.posts = posts
        presenter.showOtherBlog(isSubscribed: isSubscribed)
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
