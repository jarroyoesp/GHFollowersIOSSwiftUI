

import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

struct GitHubRouterView: View {
    private let route: GitHubAppRoute
    private let navigator: AppNavigator

    init(
        route: GitHubAppRoute,
        navigator: AppNavigator
    ) {
        self.route = route
        self.navigator = navigator
    }

    var body: some View {
        switch route {
            case .profileFollowerList(let profileId, let callbackId):
                FollowerListView(
                    viewModel: Container.GitHubContainer.resolve(
                        FollowerListViewModel.self,
                        arguments: profileId, callbackId, navigator
                    )!
                )

            case .searchProfile:
                GitHubSearchView(
                    viewModel: Container.GitHubContainer.resolve(
                        GitHubSearchViewModel.self,
                        argument: navigator
                    )!
                )

            case .userInfo(let profileId):
                UserInfoView(
                    viewModel: Container.GitHubContainer.resolve(
                        UserInfoViewModel.self,
                        arguments: profileId, navigator
                    )!
                )
                .toolbar(.hidden, for: .tabBar)
        }
    }
}
