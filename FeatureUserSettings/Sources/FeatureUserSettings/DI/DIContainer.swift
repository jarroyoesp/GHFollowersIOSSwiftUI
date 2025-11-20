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
    static let UserSettingsContainer: Container = {
        let container = Container()
        container
            .register(UserSettingsViewModel.self) { (_, appNavigator: AppNavigator) in
                UserSettingsViewModel(
                    appNavigator: appNavigator
                )
            }
            .inObjectScope(.transient)

        return container
    }()
}
