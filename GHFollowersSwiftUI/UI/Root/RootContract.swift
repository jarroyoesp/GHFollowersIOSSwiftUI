//
//  RootContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation
import NavigationModule

public class RootContract {
    public enum Event: ViewEvent {
    }

    public struct State: ViewState {
        var currrentState: AppState = .splash
        var isUserLoggedIn: Bool = false
    }

    public enum Effect: ViewEffect {}
}
