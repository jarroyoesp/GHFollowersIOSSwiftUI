//
//  Navigator.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 4/3/25.
//

import Foundation
import SwiftUI

public enum AppRoute: Hashable {
    case followerList(username: String)
}

open class Navigator: ObservableObject {
    nonisolated(unsafe) public static let shared = Navigator()

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
