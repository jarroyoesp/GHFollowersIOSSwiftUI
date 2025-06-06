//
//  BaseViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Combine
import Foundation
import SwiftUI

public protocol ViewEvent {}
public protocol ViewState {}
public protocol ViewEffect {}

open class BaseViewModel<UiEvent: ViewEvent, UiState: ViewState, UiEffect: ViewEffect>: ObservableObject {
    @Published public var state: UiState
    @Published public var effect: UiEffect?

    public let navigator = Navigator.shared

    public init(initialState: UiState) {
        state = initialState
    }

    open func send(event _: UiEvent) {
        fatalError("Subclasses must implement send(event:)")
    }

    open func onUiEvent(event: UiEvent) {
        send(event: event)
    }

    open func onLoadingChanged(loading _: Bool) {}

    public func load(block: () -> ()) {
        onLoadingChanged(loading: true)
        block()
        onLoadingChanged(loading: false)
    }
}
