//
//  RootView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 18/11/25.
//

import FeatureLogin
import NavigationModule
import SwiftUI

struct RootView: View {
    @StateObject var appFlowManager: AppFlowManager

    init(appFlowManager: AppFlowManager) {
        _appFlowManager = StateObject(wrappedValue: appFlowManager)
    }

    var body: some View {
        Group {
            switch appFlowManager.currentState {
                case .login:
                    LoginView(viewModel: LoginViewModel(appFlowManager: appFlowManager))
                        .environmentObject(appFlowManager)
                        .transition(.move(edge: .bottom))

                case .main:
                    MainView(viewModel: MainViewModel(appFlowManager: appFlowManager))
                        .environmentObject(appFlowManager)
                        .transition(.move(edge: .bottom))
            }
        }
    }
}
