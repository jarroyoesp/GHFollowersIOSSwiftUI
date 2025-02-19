//
//  SearchContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import Foundation

// Eventos de la pantalla de Login
enum SearchEvent: ViewEvent {
    case onUserNameChanged(username: String)
    case OnLoginButtonClicked
}

// Estado de la pantalla de Login
struct SearchState: ViewState {
    var isLoading: Bool
    var isAuthenticated: Bool
    var username: String = ""
}

// Efectos secundarios (como mensajes de error)
enum SearchEffect: ViewEffect {
    case showError(String)
}
