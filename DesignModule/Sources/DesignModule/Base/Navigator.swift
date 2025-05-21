//
//  Navigator.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 4/3/25.
//

import Foundation
import SwiftUI

public protocol RouteResult {}

public enum AppRoute: Hashable {
    case followerList(username: String, callbackId: UUID)
}

public struct FollowerListResult: RouteResult {
    let followerId: String
    let resultType: ResultType

    public init(followerId: String, resultType: ResultType) {
        self.followerId = followerId
        self.resultType = resultType
    }

    public enum ResultType {
        case CREATE
        case UPDATE
    }
}

open class Navigator: ObservableObject {
    public nonisolated(unsafe) static let shared = Navigator()

    @Published public var navigationPath = NavigationPath()

    private init() {}

    public func navigateTo(_ route: AppRoute) {
        navigationPath.append(route)
    }

    public func goBack() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
    }

    public func reset() {
        navigationPath = NavigationPath()
    }
}

public final class RouteCallbackRegistry {
    public nonisolated(unsafe) static let shared = RouteCallbackRegistry()

    private var callbacks: [UUID: (RouteResult) -> ()] = [:]

    public func register(callback: @escaping (RouteResult) -> ()) -> UUID {
        let id = UUID()
        callbacks[id] = callback
        return id
    }

    public func trigger(id: UUID, result: RouteResult) {
        callbacks[id]?(result)
        callbacks.removeValue(forKey: id)
    }
}
