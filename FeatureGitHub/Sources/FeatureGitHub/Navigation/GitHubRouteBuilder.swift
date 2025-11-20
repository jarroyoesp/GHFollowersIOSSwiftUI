

import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

@MainActor
public struct GitHubViews {
    private let appNavigator: AppNavigator

    public init(
        appNavigator: AppNavigator
    ) {
        self.appNavigator = appNavigator
    }

    @ViewBuilder
    public func build(route: GitHubAppRoute) -> some View {
        switch route {
            case .profileFollowerList(let profileId, let callbackId):
                FollowerListView(
                    viewModel: Container.GitHubContainer.resolve(
                        FollowerListViewModel.self,
                        arguments: profileId, callbackId, appNavigator
                    )!
                )

            case .searchProfile:
                SearchView(
                    viewModel: Container.GitHubContainer.resolve(
                        SearchViewModel.self,
                        argument: appNavigator
                    )!
                )

            case .userInfo(let profileId):
                UserInfoView(
                    viewModel: Container.GitHubContainer.resolve(
                        UserInfoViewModel.self,
                        arguments: profileId, appNavigator
                    )!
                )
                .toolbar(.hidden, for: .tabBar)
        }
    }
}
