//
//  FollowerListContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import Foundation

// Eventos de la pantalla de Login
enum FollowerListEvent: ViewEvent {
    case OnLoadMoreItems
}

// Estado de la pantalla de Login
struct FollowerListState: ViewState {
    var followerList: [Follower] = []
    var isLoading: Bool = false
    var username: String = ""
}

// Efectos secundarios (como mensajes de error)
enum FollowerListEffect: ViewEffect {
    case showError(String)
}
