import RIBs
import RxSwift
import UIKit

protocol PostPresentableListener: class {
    
}

final class PostViewController: UIViewController, PostPresentable, PostViewControllable {

    weak var listener: PostPresentableListener?
}
