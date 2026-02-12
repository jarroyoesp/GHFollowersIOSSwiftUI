//
//  SplashViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import AccountModule
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
    private let getAccessTokenInteractor: GetAccessTokenInteractor
    private let isUserLoggedInInteractor: IsUserLoggedInInteractor
    init(
        appFlowManager: AppFlowManager,
        getAccessTokenInteractor: GetAccessTokenInteractor,
        isUserLoggedInInteractor: IsUserLoggedInInteractor
    ) {
        self.appFlowManager = appFlowManager
        self.getAccessTokenInteractor = getAccessTokenInteractor
        self.isUserLoggedInInteractor = isUserLoggedInInteractor
        super.init(initialState: SplashContract.State())
        checkStatus()
    }

    override func send(event: SplashContract.Event) {
        switch event {}
    }

    private func checkStatus() {
        Task {
            let accessToken = try await getAccessTokenInteractor.invoke()
            try? await Task.sleep(for: .seconds(2))
            if accessToken.isEmpty {
                appFlowManager.logout()
            } else {
                appFlowManager.loginSuccess()
            }
        }
    }
}
