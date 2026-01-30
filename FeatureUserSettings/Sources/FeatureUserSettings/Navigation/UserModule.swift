//
//  UserModule.swift
//  FeatureGitHub
//
//  Created by Javier Arroyo on 27/1/26.
//

import Foundation
import NavigationModule
import SwiftUI

public enum UserModule {
    @MainActor public static func registerRoutes() {
        Router.shared.registerUserHandler { route, navigator, appFlowManager in
            // Return the router view, erasing its type to AnyView
            AnyView(UserRouterView(route: route, navigator: navigator, appFlowManager: appFlowManager))
        }
    }
}
