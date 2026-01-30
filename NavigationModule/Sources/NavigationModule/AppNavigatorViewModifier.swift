import SwiftUI

public struct AppNavigatorViewModifier: ViewModifier {
    @StateObject private var navigator: AppNavigator
    private var appFlowManager: AppFlowManager

    public init(
        navigator: AppNavigator,
        appFlowManager: AppFlowManager
    ) {
        _navigator = StateObject(wrappedValue: navigator)
        self.appFlowManager = appFlowManager
    }

    public func body(content: Content) -> some View {
        NavigationStack(path: $navigator.navigationPath) {
            content
                .environmentObject(navigator)
                .navigationDestination(for: AppRoute.self) { route in
                    Router.shared.view(for: route, navigator: navigator, appFlowManager: appFlowManager)
                }
        }
    }
}

public extension View {
    func appNavigatorViewModifier(
        navigator: AppNavigator,
        appFlowManager: AppFlowManager
    ) -> some View {
        modifier(
            AppNavigatorViewModifier(
                navigator: navigator,
                appFlowManager: appFlowManager
            )
        )
    }
}
