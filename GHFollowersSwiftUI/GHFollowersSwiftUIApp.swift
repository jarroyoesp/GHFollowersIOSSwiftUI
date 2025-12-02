//
//  GHFollowersSwiftUIApp.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import NavigationModule
import SwiftUI
import Swinject

@main
struct GHFollowersSwiftUIApp: App {
    let appFlowManager: AppFlowManager = Container.NavigationContainer.resolve(AppFlowManager.self)!

    var body: some Scene {
        WindowGroup {
            RootView(viewModel: Container.AppContainer.resolve(RootViewModel.self)!)
        }
    }
}
