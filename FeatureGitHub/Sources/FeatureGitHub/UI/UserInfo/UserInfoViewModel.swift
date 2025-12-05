//
//  UserInfoViewModel.swift
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

class UserInfoViewModel: BaseViewModel<UserInfoContract.Event, UserInfoContract.State, UserInfoContract.Effect> {
    private let appNavigator: AppNavigator?
    private let getUserInfoInteractor: GetUserInfoInteractor?
    private let username: String

    init(
        username: String,
        appNavigator: AppNavigator?,
        getUserInfoInteractor: GetUserInfoInteractor
    ) {
        self.username = username
        self.appNavigator = appNavigator
        self.getUserInfoInteractor = getUserInfoInteractor
        super.init(initialState: UserInfoContract.State())

        refreshData()
    }

    override func send(event: UserInfoContract.Event) {
        switch event {}
    }

    private func refreshData(page _: Int = 1) {
        state.isLoading = true
        Task {
            do {
                let user = try await getUserInfoInteractor?.invoke(for: username)
                self.state.isLoading = false
                self.state.user = user

            } catch {
                if let ghError = error as? GHError {
                    print(error)
                    self.state.isLoading = false
                }
            }
        }
    }
}
