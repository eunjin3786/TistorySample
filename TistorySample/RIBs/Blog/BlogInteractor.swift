import RIBs
import RxSwift

protocol BlogRouting: ViewableRouting {
    func routeToMyBlog()
    func routeToOtherBlog()
}

protocol BlogPresentable: Presentable {
    var listener: BlogPresentableListener? { get set }
}

protocol BlogListener: class {
    
}

final class BlogInteractor: PresentableInteractor<BlogPresentable>, BlogInteractable, BlogPresentableListener {

    weak var router: BlogRouting?
    weak var listener: BlogListener?

    init(presenter: BlogPresentable, owner: Owner) {
        super.init(presenter: presenter)
        presenter.listener = self
        
        switch owner {
        case .me:
            router?.routeToMyBlog()
        case .other:
            router?.routeToOtherBlog()
        }
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
