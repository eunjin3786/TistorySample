import RIBs
import RxSwift
import UIKit
import SnapKit

protocol BlogPresentableListener: class {
    var posts: [String] { get }
    func blogSettingButtonDidTap()
    func blogSubscriptionToggled()
}

final class BlogViewController: UIViewController, BlogPresentable, BlogViewControllable {

    weak var listener: BlogPresentableListener?
    
    @IBOutlet weak var tableView: UITableView!
    weak var subscriptionButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func showMyBlog() {
        setupBlogSettingButton()
    }
    
    func showOtherBlog(isSubscribed: Bool) {
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

extension BlogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listener?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell"), let posts = listener?.posts else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = posts[indexPath.row]
        return cell
    }
}


class PostTableViewCell: UITableViewCell {
    
}
