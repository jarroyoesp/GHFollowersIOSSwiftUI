//
//  AppFlowManager.swift
//  NavigationModule
//
//  Created by Javier Arroyo on 18/11/25.
//

import Combine

// 1. Definimos un enum para los estados principales de la App
public enum AppState {
    case login
    case main
}

// 2. El Manager que controla el estado
public class AppFlowManager: ObservableObject {
    @Published public var currentState: AppState = .login // O .login por defecto

    func logout() {
        // Aquí podrías limpiar tokens, datos de usuario, etc.
        currentState = .login
    }

    func loginSuccess() {
        currentState = .main
    }
}
