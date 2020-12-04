import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
}
