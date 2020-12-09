import RIBs
import RxSwift
import SnapKit
import UIKit

protocol MainPresentableListener: class {
    func selectedTabDidChanged(to tab: Tab)
}

enum Tab {
    case home
    case blog
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {

    @IBOutlet weak var contentView: UIView!
    
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
    
    @IBAction func homeButtonDidTap(_ sender: Any) {
        selectedTab = .home
    }
    
    @IBAction func blogButtonDidTap(_ sender: Any) {
        selectedTab = .blog
    }
    
    func show(viewController: ViewControllable) {
        addChild(viewController.uiviewController)
        contentView.addSubview(viewController.uiviewController.view)
        viewController.uiviewController.view.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalTo(contentView)
        }
    }
    
    func hide(viewController: ViewControllable) {
        viewController.uiviewController.view.removeFromSuperview()
        viewController.uiviewController.removeFromParent()
    }
}
