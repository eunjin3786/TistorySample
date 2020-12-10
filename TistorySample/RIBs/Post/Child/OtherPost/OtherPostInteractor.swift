import RIBs
import RxSwift

protocol OtherPostRouting: Routing {
    func cleanupViews()
}

protocol OtherPostListener: class {
    
}

final class OtherPostInteractor: Interactor, OtherPostInteractable {

    weak var router: OtherPostRouting?
    weak var listener: OtherPostListener?

    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
    }
}
