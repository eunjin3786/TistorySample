import RIBs
import RxSwift

protocol PostRouting: ViewableRouting {
    
}

protocol PostPresentable: Presentable {
    var listener: PostPresentableListener? { get set }
}

protocol PostListener: class {
    
}

final class PostInteractor: PresentableInteractor<PostPresentable>, PostInteractable, PostPresentableListener {

    weak var router: PostRouting?
    weak var listener: PostListener?

    override init(presenter: PostPresentable) {
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
