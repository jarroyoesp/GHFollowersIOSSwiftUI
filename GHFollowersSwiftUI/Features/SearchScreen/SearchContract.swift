//
//  SearchContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation

enum SearchEvent: ViewEvent {
    case onUserNameChanged(username: String)
    case OnSearchButtonClicked
}

struct SearchState: ViewState {
    var isLoading: Bool = false
    var username: String = ""
    var resultMessage: String = ""
    var showResult: Bool = false
}

enum SearchEffect: ViewEffect {
    case showError(String)
}
