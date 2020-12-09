import RIBs
import RxSwift
import UIKit
import SnapKit

protocol BlogPresentableListener: class {
    func viewDidLoad()
}

final class BlogViewController: UIViewController, BlogPresentable, BlogViewControllable {

    weak var listener: BlogPresentableListener?
    
    weak var descLabel: UILabel?
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        
        let label = UILabel()
        view.addSubview(label)
        label.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
        descLabel = label
        
        listener?.viewDidLoad()
    }
    
    func showMyBlog() {
        descLabel?.text = "안녕하세요 내 블로그임당"
    }
    
    func showOtherBlog() {
        descLabel?.text = "안녕하세요 남의 블로그임당"
    }
}
