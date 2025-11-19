//
//  FollowerListContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation
import NetworkModule

class FollowerListContract {
    struct State: ViewState {
        var errorMessage: String = ""
        var favoriteFollowers: [String: Bool] = [:]
        var followerList: [Follower] = []
        var isLoading: Bool = false
        var showSnackbar: Bool = false
        var username: String = ""
        var resultMessage: String = ""
        var showResult: Bool = false
    }

    enum Event: ViewEvent {
        case OnFavoriteItemClicked(username: String)
        case OnItemClicked(username: String)
        case OnLoadMoreItems
        case SendResultAndNavigateBack
    }

    enum Effect: ViewEffect {
        case showError(String)
    }
}
