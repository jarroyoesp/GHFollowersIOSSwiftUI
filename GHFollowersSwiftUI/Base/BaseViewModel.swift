//
//  BaseViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import Foundation
import SwiftUI

// Protocolos que representan los tipos genéricos
protocol ViewEvent {}
protocol ViewState {}
protocol ViewEffect {}

class BaseViewModel<UiEvent: ViewEvent, UiState: ViewState, UiEffect: ViewEffect>: ObservableObject {
    @Published var state: UiState
    @Published var effect: UiEffect?

    @State var path = NavigationPath()

    private var cancellables = Set<AnyCancellable>()

    init(initialState: UiState) {
        state = initialState
    }

    func send(event _: UiEvent) {
        fatalError("Subclasses must implement send(event:)")
    }
}
