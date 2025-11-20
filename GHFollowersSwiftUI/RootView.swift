//
//  RootView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 18/11/25.
//

import FeatureLogin
import NavigationModule
import SwiftUI
import Swinject

struct RootView: View {
    @StateObject var appFlowManager: AppFlowManager

    init(appFlowManager: AppFlowManager) {
        _appFlowManager = StateObject(wrappedValue: appFlowManager)
    }

    var body: some View {
        Group {
            switch appFlowManager.currentState {
                case .login:
                    LoginView(viewModel: Container.LoginContainer.resolve(LoginViewModel.self)!)
                        .transition(.move(edge: .bottom))

                case .main:
                    MainView(viewModel: MainViewModel())
                        .transition(.move(edge: .bottom))
            }
        }
    }
}
