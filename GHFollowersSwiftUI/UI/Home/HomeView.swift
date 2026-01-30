//
//  HomeView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import FeatureGitHub
import FeatureLogin
import FeatureUserSettings
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

public struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel

    private let githubNavigator = Container.NavigationContainer.resolve(AppNavigator.self)!
    private let userSettingsNavigator = Container.NavigationContainer.resolve(AppNavigator.self)!
    private let appFlowManager = Container.NavigationContainer.resolve(AppFlowManager.self)!
    private let deepLinkManager = Container.AppContainer.resolve(DeepLinkManager.self)!

    init(
        viewModel: HomeViewModel
    ) {
        print("JAE HomeView")
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        HomeViewMain(
            state: viewModel.state,
            sendEvent: { viewModel.onUiEvent(event: $0) },
            githubNavigator: githubNavigator,
            userSettingsNavigator: userSettingsNavigator,
            appFlowManager: appFlowManager,
            deepLinkManager: deepLinkManager
        )
    }
}

private struct HomeViewMain: View {
    let state: HomeContract.State
    let sendEvent: (_ event: HomeContract.Event) -> ()
    let githubNavigator: AppNavigator
    let userSettingsNavigator: AppNavigator
    let appFlowManager: AppFlowManager
    let deepLinkManager: DeepLinkManager

    var body: some View {
        TabView(selection: Binding(
            get: {
                state.selectedTab
            },
            set: {
                sendEvent(.onSelectedTabChanged(tab: $0))
            }
        )) {
            Tab1GitHubView(
                githubNavigator: githubNavigator,
                appFlowManager: appFlowManager
            )
            Tab2UserSettingsView(
                userSettingsNavigator: userSettingsNavigator,
                appFlowManager: appFlowManager
            )
        }
        .onOpenURL { url in
            if let destination = deepLinkManager.handle(url: url) {
                print("handle DeepLink: \(url)-\(destination)")
                sendEvent(.onOpenURL(
                    url: url,
                    gitHubNavigator: githubNavigator,
                    userSettingsNavigator: userSettingsNavigator
                ))
            } else {
                print("DeepLink no soportado: \(url)")
            }
        }
    }
}

@MainActor
@ViewBuilder
private func Tab1GitHubView(
    githubNavigator: AppNavigator,
    appFlowManager: AppFlowManager
) -> some View {
    GitHubSearchView(
        viewModel: Container.GitHubContainer.resolve(
            GitHubSearchViewModel.self,
            arguments: githubNavigator, appFlowManager
        )!
    )
    .appNavigatorViewModifier(
        navigator: githubNavigator,
        appFlowManager: appFlowManager
    )
    .tabItem {
        Label(HomeTab.tab1GitHub.title, systemImage: HomeTab.tab1GitHub.systemImage)
    }
    .tag(HomeTab.tab1GitHub)
}

@MainActor
@ViewBuilder
private func Tab2UserSettingsView(
    userSettingsNavigator: AppNavigator,
    appFlowManager: AppFlowManager
) -> some View {
    UserSettingsView(
        viewModel: Container.UserSettingsContainer.resolve(
            UserSettingsViewModel.self,
            arguments: userSettingsNavigator, appFlowManager
        )!
    )
    .appNavigatorViewModifier(
        navigator: userSettingsNavigator,
        appFlowManager: appFlowManager
    )
    .tabItem {
        Label(HomeTab.tab2UserSettings.title, systemImage: HomeTab.tab2UserSettings.systemImage)
    }
    .tag(HomeTab.tab2UserSettings)
}
