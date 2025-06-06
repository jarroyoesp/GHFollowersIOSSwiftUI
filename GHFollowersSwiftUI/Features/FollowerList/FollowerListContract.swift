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

enum FollowerListEvent: ViewEvent {
    case OnFavoriteItemClicked(username: String)
    case OnItemClicked(username: String)
    case OnLoadMoreItems
    case SendResultAndNavigateBack
}

struct FollowerListState: ViewState {
    var errorMessage: String = ""
    var favoriteFollowers: [String: Bool] = [:]
    var followerList: [Follower] = []
    var isLoading: Bool = false
    var showSnackbar: Bool = false
    var username: String = ""
    var resultMessage: String = ""
    var showResult: Bool = false
}

enum FollowerListEffect: ViewEffect {
    case showError(String)
}
