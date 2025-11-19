

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
                getUserSettingsView(appNavigator: appNavigator, networkManager: networkManager)
        }
    }
}

@MainActor
public func getUserSettingsView(
    appNavigator: AppNavigator?,
    networkManager _: NetworkManagerProtocol?
) -> AnyView {
    let viewModel = UserSettingsViewModel(appNavigator: appNavigator)
    return AnyView(
        UserSettingsView(
            viewModel: viewModel
        )
    )
}
