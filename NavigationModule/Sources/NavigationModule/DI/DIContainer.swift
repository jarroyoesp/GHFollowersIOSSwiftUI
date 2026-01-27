//
//  File.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 14/11/25.
//
import Swinject

public extension Container {
    nonisolated(unsafe) static let NavigationContainer: Container = {
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
