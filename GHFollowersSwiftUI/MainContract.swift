//
//  MainContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation

enum MainEvent: ViewEvent {}

struct MainState: ViewState {
    var isUserLoggedIn: Bool = false
}

enum MainEffect: ViewEffect {}
