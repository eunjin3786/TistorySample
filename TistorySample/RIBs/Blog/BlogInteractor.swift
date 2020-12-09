import RIBs
import RxSwift

protocol BlogRouting: ViewableRouting {
    
}

protocol BlogPresentable: Presentable {
    var listener: BlogPresentableListener? { get set }
}

protocol BlogListener: class {
    
}

final class BlogInteractor: PresentableInteractor<BlogPresentable>, BlogInteractable, BlogPresentableListener {

    weak var router: BlogRouting?
    weak var listener: BlogListener?

    override init(presenter: BlogPresentable) {
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
