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
    @StateObject private var viewModel: RootViewModel

    init(viewModel: RootViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Group {
            switch viewModel.state.currrentState {
                case .home:
                    HomeView(
                        viewModel: HomeViewModel()
                    )
                    .transition(.move(edge: .bottom))
                case .login:
                    LoginView(viewModel: Container.LoginContainer.resolve(LoginViewModel.self)!)
                        .transition(.move(edge: .bottom))
                case .splash:
                    SplashView(viewModel: SplashViewModel(
                        appFlowManager: Container.NavigationContainer.resolve(AppFlowManager.self)!,
                        isUserLoggedInInteractor: Container.LoginContainer.resolve(IsUserLoggedInInteractor.self)!
                    ))
            }
        }
    }
}
