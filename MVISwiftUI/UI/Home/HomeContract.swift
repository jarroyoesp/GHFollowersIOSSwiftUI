//
//  HomeContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation
import NavigationModule

public class HomeContract {
    enum Event: ViewEvent {
        case onOpenURL(url: URL, gitHubNavigator: AppNavigator, userSettingsNavigator: AppNavigator)
        case onSelectedTabChanged(tab: HomeTab)
    }

    struct State: ViewState {
        var selectedTab: HomeTab = .tab1GitHub
        var isUserLoggedIn: Bool = false
    }

    enum Effect: ViewEffect {}
}
