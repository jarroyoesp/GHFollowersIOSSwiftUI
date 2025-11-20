

import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

@MainActor
public struct UserViews {
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
    public func build(route: UserAppRoute, navigator _: AppNavigator) -> some View {
        switch route {
            case .userSettings:
                UserSettingsView(
                    viewModel: Container.UserSettingsContainer.resolve(
                        UserSettingsViewModel.self,
                        argument: appNavigator
                    )!
                )
        }
    }
}
