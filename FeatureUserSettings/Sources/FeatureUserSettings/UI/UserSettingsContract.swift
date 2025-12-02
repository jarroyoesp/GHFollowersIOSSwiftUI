//
//  UserSettingsContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation

public class UserSettingsContract {
    public enum Event: ViewEvent {
        case OnLogoutButtonTapped
    }

    public struct State: ViewState {}

    public enum Effect: ViewEffect {}
}
