//
//  SearchContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation

// Eventos de la pantalla de Login
enum SearchEvent: ViewEvent {
    case onUserNameChanged(username: String)
    case OnSearchButtonClicked
}

// Estado de la pantalla de Login
struct SearchState: ViewState {
    var isLoading: Bool = false
    var username: String = ""
}

// Efectos secundarios (como mensajes de error)
enum SearchEffect: ViewEffect {
    case showError(String)
}
