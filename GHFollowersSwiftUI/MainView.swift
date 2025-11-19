//
//  MainView.swift
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

public struct MainView: View {
    @StateObject private var viewModel: MainViewModel

    init(viewModel: MainViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        MainViewMain(state: viewModel.state, sendEvent: { viewModel.onUiEvent(event: $0) })
    }
}

private struct MainViewMain: View {
    let state: MainState
    let sendEvent: (_ event: MainEvent) -> ()

    let appNavigatorTab1 = Container.NavigationContainer.resolve(AppNavigator.self)!
    let appNavigatorTab2 = Container.NavigationContainer.resolve(AppNavigator.self)!
    let networkManager = Container.NetworkContainer.resolve(NetworkManagerProtocol.self)!

    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            getSearchViewView(
                appNavigator: appNavigatorTab1,
                networkManager: networkManager
            )
            .appNavigatorViewModifier(
                navigator: appNavigatorTab1,
                gitHubRouteHandler: { route in
                    GitHubViews(
                        appNavigator: appNavigatorTab1,
                        networkManager: networkManager
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

            getUserSettingsView(
                appNavigator: appNavigatorTab2,
                networkManager: networkManager
            )
            .appNavigatorViewModifier(
                navigator: appNavigatorTab2,
                gitHubRouteHandler: { route in
                    GitHubViews(
                        appNavigator: appNavigatorTab2,
                        networkManager: networkManager
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
        }
    }
}
