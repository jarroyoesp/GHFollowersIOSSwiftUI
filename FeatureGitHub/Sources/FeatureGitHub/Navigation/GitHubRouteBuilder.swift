

import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

@MainActor
public struct GitHubViews {
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
    public func build(route: GitHubAppRoute) -> some View {
        switch route {
            case .profileFollowerList(let profileId, let callbackId):
                getFollowerListView(
                    profileId: profileId,
                    callbackId: callbackId,
                    appNavigator: appNavigator,
                    networkManager: networkManager
                )
            case .searchProfile:
                getSearchViewView(
                    appNavigator: appNavigator,
                    networkManager: networkManager
                )
        }
    }
}

@MainActor
func getFollowerListView(
    profileId: String,
    callbackId: UUID,
    appNavigator: AppNavigator?,
    networkManager: NetworkManagerProtocol?
) -> AnyView {
    let viewModel = FollowerListViewModel(
        username: profileId,
        callbackId: callbackId,
        appNavigator: appNavigator,
        networkManager: networkManager
    )
    return AnyView(
        FollowerListView(
            viewModel: viewModel
        )
    )
}

@MainActor
public func getSearchViewView(
    appNavigator: AppNavigator?,
    networkManager _: NetworkManagerProtocol?
) -> AnyView {
    let viewModel = SearchViewModel(appNavigator: appNavigator)
    return AnyView(
        SearchView(
            viewModel: viewModel
        )
    )
}
