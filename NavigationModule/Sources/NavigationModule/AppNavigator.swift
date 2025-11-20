import SwiftUI
import UIKit

public class AppNavigator: ObservableObject {
    @Published public var navigationPath: [AppRoute] = []

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
}
