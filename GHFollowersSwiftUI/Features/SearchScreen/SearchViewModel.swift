//
//  SearchViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Foundation

class SearchViewModel: BaseViewModel<SearchEvent, SearchState, SearchEffect> {
    init() {
        super.init(initialState: SearchState(isLoading: false, isAuthenticated: false))
    }

    override func send(event: SearchEvent) {
        switch event {
        case .OnLoginButtonClicked:
            effect = .showError("Invalid credentials")
        case let .onUserNameChanged(username: username):
            state.username = username
        }
    }
}
