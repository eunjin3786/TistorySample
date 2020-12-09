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

final class BlogInteractor: PresentableInteractor<BlogPresentable>, BlogInteractable {

    weak var router: BlogRouting?
    weak var listener: BlogListener?
    
    private let owner: Owner

    init(presenter: BlogPresentable, owner: Owner) {
        self.owner = owner
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        switch owner {
        case .me:
            router?.routeToMyBlog()
        case .other:
            router?.routeToOtherBlog()
        }
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

extension BlogInteractor: BlogPresentableListener {

}
