//
//  UserSettingsViewModel.swift
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

public class UserSettingsViewModel: BaseViewModel<UserSettingsContract.Event, UserSettingsContract.State, UserSettingsContract.Effect> {
    private let appNavigator: AppNavigator?

    public init(appNavigator: AppNavigator?) {
        self.appNavigator = appNavigator
        super.init(initialState: UserSettingsContract.State())
    }

    override public func send(event: UserSettingsContract.Event) {
        switch event {}
    }
}
