//
//  File.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 14/11/25.
//
import FeatureGitHub
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

@MainActor
public extension Container {
    static let AppContainer: Container = {
        let container = Container()
        container
            .register(RootViewModel.self) { _ in
                RootViewModel(
                    appFlowManager: Container.NavigationContainer.resolve(AppFlowManager.self)!
                )
            }
            .inObjectScope(.transient)
        container.register(DeepLinkManager.self) { _ in
            let handlers: [DeepLinkHandler] = [
                GithubDeepLinkHandler(),
            ]
            return DeepLinkManager(handlers: handlers)
        }

        return container
    }()
}
