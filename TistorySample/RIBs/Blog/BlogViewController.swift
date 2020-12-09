import RIBs
import RxSwift
import UIKit
import SnapKit

protocol BlogPresentableListener: class {
    
}

final class BlogViewController: UIViewController, BlogPresentable, BlogViewControllable {

    weak var listener: BlogPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showBlogSetting() {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("블로그설정", for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
    }
}
