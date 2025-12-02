

import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

@MainActor
public struct UserViews {
    private let appFlowManager: AppFlowManager
    private let appNavigator: AppNavigator
    private let networkManager: NetworkManagerProtocol

    public init(
        appFlowManager: AppFlowManager,
        appNavigator: AppNavigator,
        networkManager: NetworkManagerProtocol
    ) {
        self.appFlowManager = appFlowManager
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
                        arguments: appNavigator, appFlowManager
                    )!
                )
        }
    }
}
