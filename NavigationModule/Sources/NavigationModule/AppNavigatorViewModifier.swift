import SwiftUI

public struct AppNavigatorViewModifier<
    GitHubRouteHandler: View,
    LoginRouteHandler: View,
    UserRotueHandler: View
>: ViewModifier {
    @StateObject private var navigator: AppNavigator

    private let gitHubRouteHandler: (GitHubAppRoute) -> GitHubRouteHandler
    private let loginRouteHandler: (LoginAppRoute) -> LoginRouteHandler
    private let userRouteHandler: (UserAppRoute) -> UserRotueHandler

    public init(
        navigator: AppNavigator,
        @ViewBuilder gitHubRouteHandler: @escaping (GitHubAppRoute) -> GitHubRouteHandler,
        @ViewBuilder loginRouteHandler: @escaping (LoginAppRoute) -> LoginRouteHandler,
        @ViewBuilder userRouteHandler: @escaping (UserAppRoute) -> UserRotueHandler
    ) {
        _navigator = StateObject(wrappedValue: navigator)
        self.gitHubRouteHandler = gitHubRouteHandler
        self.loginRouteHandler = loginRouteHandler
        self.userRouteHandler = userRouteHandler
    }

    public func body(content: Content) -> some View {
        NavigationStack(path: $navigator.navigationPath) {
            content
                .environmentObject(navigator)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                        case .gitHub(let gitHubAppRoute):
                            gitHubRouteHandler(gitHubAppRoute)
                        case .login(let loginAppRoute):
                            loginRouteHandler(loginAppRoute)
                        case .user(let userRoute):
                            userRouteHandler(userRoute)
                    }
                }
        }
    }
}

public extension View {
    func appNavigatorViewModifier<
        GitHubRouteHandler: View,
        LoginRouteHandler: View,
        UserRouteHandler: View
    >(
        navigator: AppNavigator,
        @ViewBuilder gitHubRouteHandler: @escaping (GitHubAppRoute) -> GitHubRouteHandler,
        @ViewBuilder loginRouteHandler: @escaping (LoginAppRoute) -> LoginRouteHandler,
        @ViewBuilder userRouteHandler: @escaping (UserAppRoute) -> UserRouteHandler
    ) -> some View {
        modifier(
            AppNavigatorViewModifier(
                navigator: navigator,
                gitHubRouteHandler: gitHubRouteHandler,
                loginRouteHandler: loginRouteHandler,
                userRouteHandler: userRouteHandler
            )
        )
    }
}
