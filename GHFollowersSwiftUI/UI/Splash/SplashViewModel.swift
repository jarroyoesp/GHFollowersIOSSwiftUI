//
//  SplashViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import FeatureLogin
import Foundation
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

class SplashViewModel: BaseViewModel<SplashContract.Event, SplashContract.State, SplashContract.Effect> {
    private let appFlowManager: AppFlowManager
    private let isUserLoggedInInteractor: IsUserLoggedInInteractor
    init(
        appFlowManager: AppFlowManager,
        isUserLoggedInInteractor: IsUserLoggedInInteractor
    ) {
        self.appFlowManager = appFlowManager
        self.isUserLoggedInInteractor = isUserLoggedInInteractor
        super.init(initialState: SplashContract.State())
        checkStatus()
    }

    override func send(event: SplashContract.Event) {
        switch event {}
    }

    private func checkStatus() {
        if isUserLoggedInInteractor.invoke() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.appFlowManager.loginSuccess()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.appFlowManager.logout()
            }
        }
    }
}
