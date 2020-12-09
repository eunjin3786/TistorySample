import RIBs
import RxSwift

protocol BlogRouting: ViewableRouting {
    func routeToMyBlog()
    func routeToOtherBlog()
    
    func routeToBlogSetting()
}

protocol BlogPresentable: Presentable {
    var listener: BlogPresentableListener? { get set }
    func showMyBlog(with posts: [String])
    func showOtherBlog(with posts: [String])
}

protocol BlogListener: class {
    
}

final class BlogInteractor: PresentableInteractor<BlogPresentable>, BlogInteractable {

    weak var router: BlogRouting?
    weak var listener: BlogListener?
    
    private let owner: Owner

    init(presenter: BlogPresentable, owner: Owner) {
        self.owner = owner
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        switch owner {
        case .me:
            router?.routeToMyBlog()
        case .other:
            router?.routeToOtherBlog()
        }
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    // MARK: - MyBlogListener
    func myPostsFetched(posts: [String]) {
        presenter.showMyBlog(with: posts)
    }
    
    // MARK: - OtherBlogListener
    func otherPostsFetched(posts: [String]) {
        presenter.showOtherBlog(with: posts)
    }
}

extension BlogInteractor: BlogPresentableListener {

    func blogSettingButtonDidTap() {
        router?.routeToBlogSetting()
    }
    
    func blogSubscriptionButtonDidTap() {
        
    }
}
