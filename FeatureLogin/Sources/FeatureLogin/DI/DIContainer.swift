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
            .register(UserRepository.self) { _ in
                MemoryUserRepositoryImpl()
            }
            .inObjectScope(.container)

        container
            .register(LoginInteractor.self) { _ in
                LoginInteractorImpl(userRepository: container.resolve(UserRepository.self)!)
            }
            .inObjectScope(.transient)

        container
            .register(IsUserLoggedInInteractor.self) { _ in
                IsUserLoggedInInteractorImpl(userRepository: container.resolve(UserRepository.self)!)
            }
            .inObjectScope(.transient)

        container
            .register(LoginViewModel.self) { _ in
                LoginViewModel(
                    appFlowManager: Container.NavigationContainer.resolve(AppFlowManager.self)!,
                    loginInteractor: container.resolve(LoginInteractor.self)!
                )
            }
            .inObjectScope(.transient)

        return container
    }()
}
