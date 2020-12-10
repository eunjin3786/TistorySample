import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func present(viewController: ViewControllable, animated: Bool = true) {
        let viewController = viewController.uiviewController
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: animated, completion: nil)
    }
}
