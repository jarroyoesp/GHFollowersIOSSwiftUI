//
//  HomeContract.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import DesignModule
import Foundation

public class HomeContract {
    enum Event: ViewEvent {
        case onOpenURL(url: URL)
    }

    struct State: ViewState {
        var isUserLoggedIn: Bool = false
    }

    enum Effect: ViewEffect {}
}
