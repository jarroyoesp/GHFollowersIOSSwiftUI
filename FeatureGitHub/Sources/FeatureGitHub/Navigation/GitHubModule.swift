//
//  GitHubModule.swift
//  FeatureGitHub
//
//  Created by Javier Arroyo on 27/1/26.
//

import Foundation
import NavigationModule
import SwiftUI

public enum GitHubModule {
    @MainActor public static func registerRoutes() {
        Router.shared.registerGitHubHandler { route, navigator in
            // Return the router view, erasing its type to AnyView
            AnyView(GitHubRouterView(route: route, navigator: navigator))
        }
    }
}
