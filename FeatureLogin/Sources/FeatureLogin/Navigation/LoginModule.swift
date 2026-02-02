//
//  LoginModule.swift
//  FeatureGitHub
//
//  Created by Javier Arroyo on 27/1/26.
//

import Foundation
import NavigationModule
import SwiftUI

public enum LoginModule {
    @MainActor public static func registerRoutes() {
        Router.shared.registerLoginHandler { route, navigator in
            // Return the router view, erasing its type to AnyView
            AnyView(LoginRouterView(route: route, navigator: navigator))
        }
    }
}
