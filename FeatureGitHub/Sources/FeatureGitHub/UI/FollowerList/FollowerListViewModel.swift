//
//  FollowerListViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

public class FollowerListViewModel: BaseViewModel<FollowerListContract.Event, FollowerListContract.State, FollowerListContract.Effect> {
    private var appNavigator: AppNavigator?
    private let username: String
    private let callbackId: UUID
    private let getFollowerListInteractor: GetFollowerListInteractor?
    private let getUserInfoInteractor: GetUserInfoInteractor?
    private var page = 1

    public init(
        username: String,
        callbackId: UUID,
        appNavigator: AppNavigator?,
        getFollowerListInteractor: GetFollowerListInteractor?,
        getUserInfoInteractor: GetUserInfoInteractor?

    ) {
        self.appNavigator = appNavigator
        self.callbackId = callbackId
        self.username = username
        self.getFollowerListInteractor = getFollowerListInteractor
        self.getUserInfoInteractor = getUserInfoInteractor
        super.init(initialState: FollowerListContract.State(username: username))
        refreshData()
    }

    override public func send(event: FollowerListContract.Event) {
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
            case .onTapUserInfoButton:
                appNavigator?.navigateTo(.gitHub(GitHubAppRoute.userInfo(profileId: username)))
        }
    }

    override public func onLoadingChanged(loading: Bool) {
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
        Task {
            do {
                let followers = try await getFollowerListInteractor?.invoke(for: username, page: page)
                self.state.isLoading = false
                self.state.followerList.append(contentsOf: followers ?? [])

            } catch {
                if let ghError = error as? GHError {
                    print(error)
                    self.state.isLoading = false
                    self.state.showSnackbar = true
                    self.state.errorMessage = error.localizedDescription
                }
            }
        }

        Task {
            do {
                let user = try await getUserInfoInteractor?.invoke(for: username)
                self.state.isLoading = false
                self.state.userInfo = user

            } catch {
                if let ghError = error as? GHError {
                    print(error)
                    self.state.isLoading = false
                }
            }
        }
    }

    private func onLoadMoreItems() {
        page += 1
        refreshData(page: page)
    }
}
