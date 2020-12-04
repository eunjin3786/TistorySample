import RIBs
import RxSwift
import UIKit

protocol MainPresentableListener: class {
    func selectedTabDidChanged(to tab: Tab)
}

enum Tab {
    case home
    case blog
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {

    @IBOutlet weak var homeTabButton: UIButton!
    @IBOutlet weak var blogTabButton: UIButton!
    
    weak var listener: MainPresentableListener?
    
    private var selectedTab: Tab = .home {
        didSet {
            listener?.selectedTabDidChanged(to: selectedTab)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
