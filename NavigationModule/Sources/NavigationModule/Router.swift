import SwiftUI

public class Router {
    @MainActor public static let shared = Router()

    private var gitHubRouteHandler: ((GitHubAppRoute, AppNavigator) -> AnyView)?
    private var loginRouteHandler: ((LoginAppRoute, AppNavigator) -> AnyView)?
    private var userRouteHandler: ((UserAppRoute, AppNavigator, AppFlowManager) -> AnyView)?

    private init() {} // Private initializer to ensure singleton usage

    public func registerGitHubHandler(_ handler: @escaping (GitHubAppRoute, AppNavigator) -> AnyView) {
        gitHubRouteHandler = handler
    }

    public func registerLoginHandler(_ handler: @escaping (LoginAppRoute, AppNavigator) -> AnyView) {
        loginRouteHandler = handler
    }

    public func registerUserHandler(_ handler: @escaping (UserAppRoute, AppNavigator, AppFlowManager) -> AnyView) {
        userRouteHandler = handler
    }

    @ViewBuilder
    public func view(for route: AppRoute, navigator: AppNavigator, appFlowManager: AppFlowManager) -> some View {
        switch route {
            case .gitHub(let gitHubRoute):
                if let handler = gitHubRouteHandler {
                    handler(gitHubRoute, navigator)
                } else {
                    Text("GitHub Route Handler not registered")
                        .foregroundColor(.red)
                }
            case .login(let loginRoute):
                if let handler = loginRouteHandler {
                    handler(loginRoute, navigator)
                } else {
                    Text("Login Route Handler not registered")
                        .foregroundColor(.red)
                }
            case .user(let userRoute):
                if let handler = userRouteHandler {
                    handler(userRoute, navigator, appFlowManager)
                } else {
                    Text("User Route Handler not registered")
                        .foregroundColor(.red)
                }
        }
    }
}
