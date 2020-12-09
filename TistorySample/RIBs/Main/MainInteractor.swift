import RIBs
import RxSwift

protocol MainRouting: ViewableRouting {
    func routeToBlog()
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
}

protocol MainListener: class {
    
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {

    weak var router: MainRouting?
    weak var listener: MainListener?

    override init(presenter: MainPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    func selectedTabDidChanged(to tab: Tab) {
        switch tab {
        case .home:
            break
        case .blog:
            router?.routeToBlog()
        }
    }
}
