//
//  FollowerListContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import Foundation
import NetworkModule
import DesignModule

// Eventos de la pantalla de Login
enum FollowerListEvent: ViewEvent {
    case OnFavoriteItemClicked(username: String)
    case OnItemClicked(username: String)
    case OnLoadMoreItems
}

// Estado de la pantalla de Login
struct FollowerListState: ViewState {
    var favoriteFollowers: [String: Bool] = [:]
    var followerList: [Follower] = []
    var isLoading: Bool = false
    var showSnackbar: Bool = false
    var username: String = ""
}

// Efectos secundarios (como mensajes de error)
enum FollowerListEffect: ViewEffect {
    case showError(String)
}
