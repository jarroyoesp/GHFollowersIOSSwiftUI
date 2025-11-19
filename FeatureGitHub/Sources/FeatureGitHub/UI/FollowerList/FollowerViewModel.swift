//
//  FollowerViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

class FollowerListViewModel: BaseViewModel<FollowerListContract.Event, FollowerListContract.State, FollowerListContract.Effect> {
    private var appNavigator: AppNavigator?
    private let username: String
    private let callbackId: UUID
    private let networkManager: NetworkManagerProtocol?
    private var page = 1

    init(
        username: String,
        callbackId: UUID,
        appNavigator: AppNavigator?,
        networkManager: NetworkManagerProtocol?
    ) {
        self.appNavigator = appNavigator
        self.callbackId = callbackId
        self.username = username
        self.networkManager = networkManager
        super.init(initialState: FollowerListContract.State(username: username))
        refreshData()
    }

    override func send(event: FollowerListContract.Event) {
        switch event {
            case .OnFavoriteItemClicked(username: let username):
                handleOnFavoriteItemClicked(username: username)
            case .OnItemClicked(username: let username):
                handleOnItemClicked(username: username)
            case .OnLoadMoreItems:
                onLoadMoreItems()
            case .SendResultAndNavigateBack:
                RouteCallbackRegistry.shared.trigger(
                    id: callbackId,
                    result: FollowerListResult(followerId: username, resultType: FollowerListResult.ResultType.UPDATE)
                )
                appNavigator?.pop()
        }
    }

    override func onLoadingChanged(loading: Bool) {
        state.isLoading = loading
    }

    private func handleOnFavoriteItemClicked(username: String) {
        print("OnFavoriteItemClicked \(username)")
        let isFav = state.favoriteFollowers[username] ?? false
        state.favoriteFollowers[username] = !isFav
    }

    private func handleOnItemClicked(username: String) {
        print("Navigate to FollowerDetailRoute \(username)")
        let callbackId = RouteCallbackRegistry.shared.register { result in
            if let result = result as? FollowerListResult {
                self.state.resultMessage = "\(result)"
                self.state.showResult = true
            }
        }

        appNavigator?.navigateTo(.gitHub(GitHubAppRoute.profileFollowerList(profileId: username, callbackId: callbackId)))
    }

    private func refreshData(page: Int = 1) {
        state.isLoading = true
        networkManager?.getFollowers(for: username, page: page) { result in
            print("Result for \(self.state.username): \n \(result)")
            switch result {
                case .success(let followers):
                    self.state.isLoading = false
                    self.state.followerList.append(contentsOf: followers)

                case .failure(let error):
                    print(error)
                    self.state.isLoading = false
                    self.state.showSnackbar = true
                    self.state.errorMessage = error.localizedDescription
            }
        }
    }

    private func onLoadMoreItems() {
        page += 1
        refreshData(page: page)
    }
}
