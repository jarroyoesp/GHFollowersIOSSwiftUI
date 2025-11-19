//
//  LoginContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation

public class LoginContract {
    public struct State: ViewState {
        var isLoading: Bool = false
        var username: String = ""
    }

    public enum Event: ViewEvent {
        case onUserNameChanged(username: String)
        case OnLoginButtonClicked
    }

    public enum Effect: ViewEffect {
        case showError(String)
    }
}
