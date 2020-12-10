import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func routeToMain()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
}

protocol RootListener: class {
    
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?

    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // 일단 지금은 무조건 Main. (로그인 없으니까)
        router?.routeToMain()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
