import Foundation
import RIBs

class AppComponent: Component<EmptyDependency> {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
