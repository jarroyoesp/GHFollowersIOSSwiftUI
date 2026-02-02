//
//  HomeViewModel.swift
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

class HomeViewModel: BaseViewModel<HomeContract.Event, HomeContract.State, HomeContract.Effect> {
    init() {
        super.init(initialState: HomeContract.State())
    }

    override func send(event: HomeContract.Event) {
        switch event {
            case .onOpenURL(url: let url, let gitHubNavigator, let userSettingsNavigator):
                handleDeepLink(url, gitHubNavigator: gitHubNavigator, userSettingsNavigator: userSettingsNavigator)
            case .onSelectedTabChanged(let tab):
                state.selectedTab = tab
        }
    }

    private func handleDeepLink(
        _ url: URL,
        gitHubNavigator: AppNavigator,
        userSettingsNavigator _: AppNavigator
    ) {
        guard let scheme = url.scheme, scheme == "ghFollowersApp" else { return }
        switch url.host {
            case "search":
                state.selectedTab = HomeTab.tab1GitHub
                let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
                if let user = components?.queryItems?.first(where: { $0.name == "user" })?.value {
                    gitHubNavigator.navigateTo(.gitHub(GitHubAppRoute.profileFollowerList(profileId: user, callbackId: UUID())))
                }

            default:
                print("Deep link no reconocido")
        }
    }
}
