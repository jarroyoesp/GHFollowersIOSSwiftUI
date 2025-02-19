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
    case OnViewDidLoad(username: String)
    case onUserNameChanged(username: String)
    case OnLoginButtonClicked
}

// Estado de la pantalla de Login
struct FollowerListState: ViewState {
    var followerList: [Follower] = []
    var isLoading: Bool
    var username: String = ""
}

// Efectos secundarios (como mensajes de error)
enum FollowerListEffect: ViewEffect {
    case showError(String)
}
