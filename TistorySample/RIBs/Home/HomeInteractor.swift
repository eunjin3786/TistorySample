import RIBs
import RxSwift

protocol HomeRouting: ViewableRouting {
    func routeToOtherBlog()
}

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
}

protocol HomeListener: class {
    
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable {

    weak var router: HomeRouting?
    weak var listener: HomeListener?

    override init(presenter: HomePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

extension HomeInteractor: HomePresentableListener {
    
    func mySubscriberDidTap() {
        router?.routeToOtherBlog()
    }
}
