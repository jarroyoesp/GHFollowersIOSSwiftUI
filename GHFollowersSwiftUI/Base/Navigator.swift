//
//  Navigator.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 4/3/25.
//

import Foundation
import SwiftUI

enum AppRoute: Hashable {
    case followerList(username: String)
}

open class Navigator: ObservableObject {
    static let shared = Navigator()

    @Published public var navigationPath = NavigationPath()

    private init() {}

    func navigateTo(_ route: AppRoute) {
        navigationPath.append(route)
    }

    func goBack() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
    }

    func reset() {
        navigationPath = NavigationPath()
    }
}

extension View {
    func handleNavigationDestination() -> some View {
        navigationDestination(for: AppRoute.self) { route in
            switch route {
                case .followerList(let username):
                    FollowerListView(userName: username)
            }
        }
    }
}
