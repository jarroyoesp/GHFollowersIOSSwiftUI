//
//  UserInfoContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation
import NetworkModule

class UserInfoContract {
    struct State: ViewState {
        var isLoading: Bool = false
        var username: String = ""
        var user: User? = nil
    }

    enum Event: ViewEvent {}

    enum Effect: ViewEffect {}
}
