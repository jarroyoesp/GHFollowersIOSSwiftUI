

import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

@MainActor
struct UserRouterView: View {
    private let route: UserAppRoute
    private let navigator: AppNavigator
    private let appFlowManager: AppFlowManager

    init(
        route: UserAppRoute,
        navigator: AppNavigator,
        appFlowManager: AppFlowManager
    ) {
        self.route = route
        self.navigator = navigator
        self.appFlowManager = appFlowManager
    }

    var body: some View {
        switch route {
            case .userSettings:
                UserSettingsView(
                    viewModel: Container.UserSettingsContainer.resolve(
                        UserSettingsViewModel.self,
                        arguments: navigator, appFlowManager
                    )!
                )
        }
    }
}
