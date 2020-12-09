import RIBs
import RxSwift

protocol MyBlogRouting: Routing {
    func cleanupViews()
}

protocol MyBlogListener: class {
    func myPostsFetched(posts: [String])
}

final class MyBlogInteractor: Interactor, MyBlogInteractable {

    weak var router: MyBlogRouting?
    weak var listener: MyBlogListener?

    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
        
        let posts = ["내 글1", "내 글2"]
        listener?.myPostsFetched(posts: posts)
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
