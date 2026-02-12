//
//  DIContainer.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 14/11/25.
//

import NetworkModule
import SwiftUI
import Swinject

@MainActor
public extension Container {
    static let AccountContainer: Container = {
        let container = Container()
        container
            .register(GetAccessTokenInteractor.self) { _ in
                GetAccessTokenInteractorImpl(networkManager: Container.NetworkContainer.resolve(NetworkManagerProtocol.self)!)
            }
            .inObjectScope(.container)

        return container
    }()
}
