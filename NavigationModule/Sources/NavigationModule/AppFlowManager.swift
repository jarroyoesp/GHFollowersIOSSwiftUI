//
//  AppFlowManager.swift
//  NavigationModule
//
//  Created by Javier Arroyo on 18/11/25.
//

import Combine

public enum AppState {
    case home
    case login
    case splash
}

public class AppFlowManager: ObservableObject {
    public let currentStatus = CurrentValueSubject<AppState, Never>(.splash)

    public func logout() {
        currentStatus.send(.login)
    }

    public func loginSuccess() {
        currentStatus.send(.home)
    }
}
