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
                handleOnSearchButtonClicked()
            case .onUserNameChanged(username: let username):
                state.username = username
        }
    }

    private func handleOnSearchButtonClicked() {
        let callbackId = RouteCallbackRegistry.shared.register { result in
            if let result = result as? FollowerListResult {
                self.state.resultMessage = "Result \(result)"
                self.state.showResult = true
            }
        }
        navigator.navigateTo(AppRoute.followerList(username: state.username, callbackId: callbackId))
    }
}
