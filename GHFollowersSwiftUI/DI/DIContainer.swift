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
    static let AppContainer: Container = {
        let container = Container()
        container
            .register(RootViewModel.self) { _ in
                RootViewModel(
                    appFlowManager: Container.NavigationContainer.resolve(AppFlowManager.self)!
                )
            }
            .inObjectScope(.transient)

        return container
    }()
}
