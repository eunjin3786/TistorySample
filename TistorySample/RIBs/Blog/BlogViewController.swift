import RIBs
import RxSwift
import UIKit
import SnapKit

protocol BlogPresentableListener: class {
    func blogSettingButtonDidTap()
    func blogSubscriptionButtonDidTap()
}

final class BlogViewController: UIViewController, BlogPresentable, BlogViewControllable {

    weak var listener: BlogPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showMyBlog(with posts: [String]) {
        setupBlogSettingButton()
    }
    
    func showOtherBlog(with posts: [String]) {
        setupBlogSubscriptionButton()
    }
    
    func setupBlogSettingButton() {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("블로그설정", for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { (maker) in
            maker.trailing.equalToSuperview()
            maker.top.equalTo(100)
        }
        button.addTarget(self, action: #selector(blogSettingButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    func blogSettingButtonDidTap() {
        listener?.blogSettingButtonDidTap()
    }
    
    func setupBlogSubscriptionButton() {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("블로그 구독", for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { (maker) in
            maker.trailing.equalToSuperview()
            maker.top.equalTo(100)
        }
        button.addTarget(self, action: #selector(blogSubscriptionButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    func blogSubscriptionButtonDidTap() {
        listener?.blogSubscriptionButtonDidTap()
    }
}
