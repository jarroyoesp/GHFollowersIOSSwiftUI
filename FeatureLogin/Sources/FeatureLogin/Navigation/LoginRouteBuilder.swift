

import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

@MainActor
public struct LoginRouteBuilder {
    private let appNavigator: AppNavigator
    private let networkManager: NetworkManagerProtocol

    public init(
        appNavigator: AppNavigator,
        networkManager: NetworkManagerProtocol
    ) {
        self.appNavigator = appNavigator
        self.networkManager = networkManager
    }

    @ViewBuilder
    public func build(route: LoginAppRoute) -> some View {
        switch route {
            case .login:
                Text("adsf")
                // DO NOTHING - REMOVE LoginView(viewModel: LoginViewModel())
                // DO NOTHING - REMOVE     .toolbar(.hidden, for: .tabBar)
        }
    }
}
