//
//  SearchViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import Foundation
import SwiftUI

class SearchViewModel: BaseViewModel<SearchEvent, SearchState, SearchEffect> {
    init() {
        super.init(initialState: SearchState())
    }

    override func send(event: SearchEvent) {
        switch event {
            case .OnSearchButtonClicked:
                navigator.navigateTo(AppRoute.followerList(username: state.username))
            case .onUserNameChanged(username: let username):
                state.username = username
        }
    }
}
