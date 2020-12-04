import RIBs
import RxSwift
import UIKit

protocol MainPresentableListener: class {
    
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {

    weak var listener: MainPresentableListener?
}
