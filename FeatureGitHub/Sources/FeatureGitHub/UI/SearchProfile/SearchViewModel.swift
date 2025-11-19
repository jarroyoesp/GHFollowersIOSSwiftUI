//
//  SearchViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import Foundation
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

class SearchViewModel: BaseViewModel<SearchContract.Event, SearchContract.State, SearchContract.Effect> {
    private let appNavigator: AppNavigator?

    init(appNavigator: AppNavigator?) {
        self.appNavigator = appNavigator
        super.init(initialState: SearchContract.State())
    }

    override func send(event: SearchContract.Event) {
        switch event {
            case .OnSearchButtonClicked:
                handleOnSearchButtonClicked()
            case .onUserNameChanged(username: let username):
                state.username = username
            case .OnUserSettingsButtonClicked:
                appNavigator?.navigateTo(.user(UserAppRoute.userSettings))
            case .OnLogoutButtonTapped:
                Container.NavigationContainer.resolve(AppFlowManager.self)?.currentState = .login
        }
    }

    private func handleOnSearchButtonClicked() {
        let callbackId = RouteCallbackRegistry.shared.register { result in
            if let result = result as? FollowerListResult {
                self.state.resultMessage = "\(result)"
                self.state.showResult = true
            }
        }
        appNavigator?.navigateTo(.gitHub(GitHubAppRoute.profileFollowerList(profileId: state.username, callbackId: callbackId)))
    }
}
