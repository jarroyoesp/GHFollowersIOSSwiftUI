//
//  SearchContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation

class SearchContract {
    struct State: ViewState {
        var isLoading: Bool = false
        var username: String = ""
        var resultMessage: String = ""
        var showResult: Bool = false
    }

    enum Event: ViewEvent {
        case OnLogoutButtonTapped
        case onUserNameChanged(username: String)
        case OnSearchButtonClicked
        case OnUserSettingsButtonClicked
    }

    enum Effect: ViewEffect {
        case showError(String)
    }
}
