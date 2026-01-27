//
//  File.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 14/11/25.
//
import Swinject

public extension Container {
    nonisolated(unsafe) static let NetworkContainer: Container = {
        let container = Container()
        container.register(NetworkManagerProtocol.self) { _ in NetworkManager() }
        return container
    }()
}
