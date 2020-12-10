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
        setupTransparentNavigation()
        setupGNB()
        selectedTab = .home
    }
    
    private func setupTransparentNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setupGNB() {
        let barButtonItem = UIBarButtonItem(title: "안녕", style: .plain, target: self, action: #selector(profileButtonDidTap))
        barButtonItem.tintColor = UIColor.blue
        
        self.navigationItem.rightBarButtonItems = [barButtonItem]
    }
    
    @objc
    func profileButtonDidTap() {
        
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
