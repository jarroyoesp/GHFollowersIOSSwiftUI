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

public class SearchViewModel: BaseViewModel<SearchContract.Event, SearchContract.State, SearchContract.Effect> {
    private let appNavigator: AppNavigator?
    private let appFlowManager: AppFlowManager

    public init(
        appNavigator: AppNavigator?,
        appFlowManager: AppFlowManager
    ) {
        self.appNavigator = appNavigator
        self.appFlowManager = appFlowManager
        super.init(initialState: SearchContract.State())
    }

    override public func send(event: SearchContract.Event) {
        switch event {
            case .OnSearchButtonClicked:
                handleOnSearchButtonClicked()
            case .onUserNameChanged(username: let username):
                state.username = username
            case .OnLogoutButtonTapped:
                appFlowManager.logout()
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
