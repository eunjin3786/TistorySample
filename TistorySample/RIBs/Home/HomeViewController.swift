import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: class {
    
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?
}
