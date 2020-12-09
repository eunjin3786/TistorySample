import RIBs
import RxSwift
import UIKit

protocol BlogPresentableListener: class {
    
}

final class BlogViewController: UIViewController, BlogPresentable, BlogViewControllable {

    weak var listener: BlogPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
    }
}
