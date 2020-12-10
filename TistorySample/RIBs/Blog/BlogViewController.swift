import RIBs
import RxSwift
import UIKit
import SnapKit

protocol BlogPresentableListener: class {
    func blogSettingButtonDidTap()
    func blogSubscriptionToggled()
}

final class BlogViewController: UIViewController, BlogPresentable, BlogViewControllable {

    weak var listener: BlogPresentableListener?
    weak var subscriptionButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showMyBlog(with posts: [String]) {
        setupBlogSettingButton()
    }
    
    func showOtherBlog(with posts: [String], isSubscribed: Bool) {
        setupBlogSubscriptionButton(isSubscribed: isSubscribed)
    }
    
    func toggleSubscription(to isSubscribed: Bool) {
        subscriptionButton?.setTitle(isSubscribed ? "블로그 구독" : "블로그 구독 취소", for: .normal)
    }
    
    private func setupBlogSettingButton() {
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
    private func blogSettingButtonDidTap() {
        listener?.blogSettingButtonDidTap()
    }
    
    private func setupBlogSubscriptionButton(isSubscribed: Bool) {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(isSubscribed ? "블로그 구독" : "블로그 구독 취소", for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { (maker) in
            maker.trailing.equalToSuperview()
            maker.top.equalTo(100)
        }
        button.addTarget(self, action: #selector(toggleBlogSubscriptionDidTap), for: .touchUpInside)
        subscriptionButton = button
    }
    
    @objc
    private func toggleBlogSubscriptionDidTap() {
        listener?.blogSubscriptionToggled()
    }
}
