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
    private let appNavigatorTab1: AppNavigator

    init(
        viewModel: HomeViewModel,
        appNavigatorTab1: AppNavigator
    ) {
        self.appNavigatorTab1 = appNavigatorTab1
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        HomeViewMain(
            state: viewModel.state,
            sendEvent: { viewModel.onUiEvent(event: $0) },
            appNavigatorTab1: appNavigatorTab1
        )
    }
}

private struct HomeViewMain: View {
    let state: HomeContract.State
    let sendEvent: (_ event: HomeContract.Event) -> ()

    let appNavigatorTab1: AppNavigator
    let appNavigatorTab2 = Container.NavigationContainer.resolve(AppNavigator.self)!
    let networkManager = Container.NetworkContainer.resolve(NetworkManagerProtocol.self)!
    let appFlowManager = Container.NavigationContainer.resolve(AppFlowManager.self)!
    let deepLinkManager = Container.AppContainer.resolve(DeepLinkManager.self)!

    @State private var selectedTab: Int = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            SearchView(
                viewModel: Container.GitHubContainer.resolve(
                    SearchViewModel.self,
                    arguments: appNavigatorTab1, appFlowManager
                )!
            )
            .appNavigatorViewModifier(
                navigator: appNavigatorTab1,
                gitHubRouteHandler: { route in
                    GitHubViews(
                        appNavigator: appNavigatorTab1
                    ).build(route: route)
                },
                loginRouteHandler: { route in
                    LoginRouteBuilder(
                        appNavigator: appNavigatorTab1,
                        networkManager: networkManager
                    )
                    .build(route: route)
                },
                userRouteHandler: { route in
                    UserViews(
                        appFlowManager: appFlowManager,
                        appNavigator: appNavigatorTab2,
                        networkManager: networkManager
                    )
                    .build(route: route, navigator: appNavigatorTab1)
                }
            )
            .tabItem {
                Label("Inicio", systemImage: "house")
            }
            .tag(0)
            .onAppear {
                print("OnAppear SearchView")
            }
            
            UserSettingsView(
                viewModel: Container.UserSettingsContainer.resolve(
                    UserSettingsViewModel.self,
                    arguments: appNavigatorTab2, appFlowManager
                )!
            )
            .appNavigatorViewModifier(
                navigator: appNavigatorTab2,
                gitHubRouteHandler: { route in
                    GitHubViews(
                        appNavigator: appNavigatorTab2
                    ).build(route: route)
                },
                loginRouteHandler: { route in
                    LoginRouteBuilder(
                        appNavigator: appNavigatorTab2,
                        networkManager: networkManager
                    )
                    .build(route: route)
                },
                userRouteHandler: { route in
                    UserViews(
                        appFlowManager: appFlowManager,
                        appNavigator: appNavigatorTab2,
                        networkManager: networkManager
                    )
                    .build(route: route, navigator: appNavigatorTab2)
                }
            )
            .tabItem {
                Label("Ajustes", systemImage: "gear")
            }
            .tag(1)
            .badge(3)
            .onAppear {
                print("OnAppear UserSettingsView")
            }
            
        }
        .onOpenURL { url in
            if let destination = deepLinkManager.handle(url: url) {
                print("handle DeepLink: \(url)")
                sendEvent(.onOpenURL(url: url))
            } else {
                print("DeepLink no soportado: \(url)")
            }
        }
    }
}
