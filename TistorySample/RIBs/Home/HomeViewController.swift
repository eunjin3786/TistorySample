import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: class {
    func mySubscriberDidTap()
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mySubscriberDidTap(_ sender: Any) {
        listener?.mySubscriberDidTap()
    }
    
    func push(viewController: ViewControllable) {
        self.navigationController?.pushViewController(viewController.uiviewController, animated: true)
    }
}
