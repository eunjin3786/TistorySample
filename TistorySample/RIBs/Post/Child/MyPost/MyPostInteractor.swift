import RIBs
import RxSwift

protocol MyPostRouting: Routing {
    func cleanupViews()
}

protocol MyPostListener: class {
    
}

final class MyPostInteractor: Interactor, MyPostInteractable {

    weak var router: MyPostRouting?
    weak var listener: MyPostListener?

    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
    }
}
