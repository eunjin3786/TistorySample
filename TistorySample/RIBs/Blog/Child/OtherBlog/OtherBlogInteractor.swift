import RIBs
import RxSwift

protocol OtherBlogRouting: Routing {
    func cleanupViews()
}

protocol OtherBlogListener: class {
    
}

final class OtherBlogInteractor: Interactor, OtherBlogInteractable {

    weak var router: OtherBlogRouting?
    weak var listener: OtherBlogListener?

    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
