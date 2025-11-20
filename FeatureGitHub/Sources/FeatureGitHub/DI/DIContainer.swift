//
//  File.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 14/11/25.
//
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

@MainActor
public extension Container {
    static let GitHubContainer: Container = {
        let container = Container()
        container
            .register(GetFollowerListInteractor.self) { _ in
                GetFollowerListInteractorImpl(
                    networkManager: Container.NetworkContainer.resolve(NetworkManagerProtocol.self)!
                )
            }
            .inObjectScope(.transient)
        container
            .register(GetUserInfoInteractor.self) { _ in
                GetUserInfoInteractorImpl(
                    networkManager: Container.NetworkContainer.resolve(NetworkManagerProtocol.self)!
                )
            }
            .inObjectScope(.transient)

        container
            .register(FollowerListViewModel.self) { (_, username: String, callbackId: UUID, appNavigator: AppNavigator) in
                FollowerListViewModel(
                    username: username,
                    callbackId: callbackId,
                    appNavigator: appNavigator,
                    getFollowerListInteractor: Container.GitHubContainer.resolve(GetFollowerListInteractor.self)!,
                    getUserInfoInteractor: Container.GitHubContainer.resolve(GetUserInfoInteractor.self)!
                )
            }
            .inObjectScope(.transient)

        container
            .register(UserInfoViewModel.self) { (_, username: String, appNavigator: AppNavigator) in
                UserInfoViewModel(
                    username: username,
                    appNavigator: appNavigator,
                    getUserInfoInteractor: Container.GitHubContainer.resolve(GetUserInfoInteractor.self)!
                )
            }
            .inObjectScope(.transient)

        container
            .register(SearchViewModel.self) { (_, appNavigator: AppNavigator) in
                SearchViewModel(
                    appNavigator: appNavigator
                )
            }
            .inObjectScope(.transient)

        return container
    }()
}
