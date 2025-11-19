import SwiftUI
import UIKit

public class AppNavigator: ObservableObject {
    @Published public var navigationPath: [AppRoute] = []

    public var navigationController: UINavigationController?

    public init(
        navigationController: UINavigationController? = nil
    ) {
        self.navigationController = navigationController
    }

    // MARK: - Navigation Methods

    public func navigateTo(_ route: AppRoute) {
        navigationPath.append(route)
    }

    public func pop() {
        _ = navigationPath.popLast()
    }

    public func popToRoot() {
        navigationPath.removeAll()
    }

    public func navigateToLogin() {
        navigationPath = [AppRoute.login(LoginAppRoute.login)]
    }

    // MARK: - UIKit Navigation Bar Helpers

    public func showNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    public func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
