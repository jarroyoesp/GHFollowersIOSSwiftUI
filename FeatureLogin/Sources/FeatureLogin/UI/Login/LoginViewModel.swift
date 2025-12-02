//
//  LoginViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import Foundation
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

public class LoginViewModel: BaseViewModel<LoginContract.Event, LoginContract.State, LoginContract.Effect> {
    private let appFlowManager: AppFlowManager
    private let loginInteractor: LoginInteractor

    public init(
        appFlowManager: AppFlowManager,
        loginInteractor: LoginInteractor
    ) {
        self.appFlowManager = appFlowManager
        self.loginInteractor = loginInteractor
        super.init(initialState: LoginContract.State())
    }

    override public func send(event: LoginContract.Event) {
        switch event {
            case .OnLoginButtonClicked:
                handleOnLoginButtonClicked()
            case .onUserNameChanged(username: let username):
                state.username = username
        }
    }

    private func handleOnLoginButtonClicked() {
        loginInteractor.invoke(for: state.username) { result in
            switch result {
                case .success:
                    self.appFlowManager.loginSuccess()
                case .failure:
                    print("Error")
            }
        }
    }
}
