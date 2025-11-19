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

    public init(appFlowManager: AppFlowManager) {
        self.appFlowManager = appFlowManager
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
        appFlowManager.currentState = .main
    }
}
