

import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

@MainActor
struct LoginRouterView: View {
    private let route: LoginAppRoute
    private let navigator: AppNavigator

    init(
        route: LoginAppRoute,
        navigator: AppNavigator
    ) {
        self.route = route
        self.navigator = navigator
    }

    var body: some View {
        switch route {
            case .login:
                LoginView(
                    viewModel: Container.LoginContainer.resolve(LoginViewModel.self)!
                )
        }
    }
}
