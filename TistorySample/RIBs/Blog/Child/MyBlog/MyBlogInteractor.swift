import RIBs
import RxSwift

protocol MyBlogRouting: Routing {
    func cleanupViews()
}

protocol MyBlogListener: class {
    
}

final class MyBlogInteractor: Interactor, MyBlogInteractable {

    weak var router: MyBlogRouting?
    weak var listener: MyBlogListener?

    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
