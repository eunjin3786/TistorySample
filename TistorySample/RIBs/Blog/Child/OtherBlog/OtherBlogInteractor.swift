import RIBs
import RxSwift

protocol OtherBlogRouting: Routing {
    func cleanupViews()
}

protocol OtherBlogListener: class {
    func otherPostsFetched(posts: [String])
}

final class OtherBlogInteractor: Interactor, OtherBlogInteractable {

    weak var router: OtherBlogRouting?
    weak var listener: OtherBlogListener?

    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
        
        let posts = ["다른 사람 글1", "다른 사람 글2"]
        listener?.otherPostsFetched(posts: posts)
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
