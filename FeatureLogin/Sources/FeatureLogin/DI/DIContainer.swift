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
    static let LoginContainer: Container = {
        let container = Container()
        container
            .register(LoginViewModel.self) { _ in
                LoginViewModel(
                    appFlowManager: Container.NavigationContainer.resolve(AppFlowManager.self)!
                )
            }
            .inObjectScope(.transient)

        return container
    }()
}
