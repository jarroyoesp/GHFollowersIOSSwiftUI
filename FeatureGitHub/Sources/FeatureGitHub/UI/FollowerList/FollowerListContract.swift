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

public class FollowerListContract {
    public struct State: ViewState {
        var errorMessage: String = ""
        var favoriteFollowers: [String: Bool] = [:]
        var followerList: [Follower] = []
        var isLoading: Bool = false
        var showSnackbar: Bool = false
        var userInfo: User? = nil
        var username: String = ""
        var resultMessage: String = ""
        var showResult: Bool = false
    }

    public enum Event: ViewEvent {
        case OnFavoriteItemClicked(username: String)
        case OnItemClicked(username: String)
        case OnLoadMoreItems
        case onTapUserInfoButton
        case SendResultAndNavigateBack
    }

    public enum Effect: ViewEffect {
        case showError(String)
    }
}
