//
//  LoginView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import FeatureGitHub
import NavigationModule
import SwiftUI
import Swinject

public struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel

    public init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        LoginViewMain(state: viewModel.state, sendEvent: { viewModel.onUiEvent(event: $0) })
    }
}

private struct LoginViewMain: View {
    let state: LoginContract.State
    let sendEvent: (_ event: LoginContract.Event) -> ()

    var body: some View {
        VStack {
            TextField("Username", text: Binding(
                get: { state.username },
                set: { sendEvent(.onUserNameChanged(username: $0)) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            Button(action: {
                sendEvent(.OnLoginButtonClicked)
            }) {
                Text("Login")
            }
        }
        .padding()
    }
}

#Preview {
    LoginViewMain(
        state: LoginContract.State(username: "user"), sendEvent: { _ in }
    )
}
