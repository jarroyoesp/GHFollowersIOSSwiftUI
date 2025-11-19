//
//  File.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 14/11/25.
//
import Swinject

@MainActor
public extension Container {
    static let NavigationContainer: Container = {
        let container = Container()
        container
            .register(AppNavigator.self) { _ in AppNavigator() }
            .inObjectScope(.transient)
        container
            .register(AppFlowManager.self) { _ in AppFlowManager() }
            .inObjectScope(.container)
        return container
    }()
}
