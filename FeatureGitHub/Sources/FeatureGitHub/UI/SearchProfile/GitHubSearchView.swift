//
//  GitHubSearchView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import FeatureGitHub
import NavigationModule
import SwiftUI
import Swinject

public struct GitHubSearchView: View {
    @StateObject private var viewModel: GitHubSearchViewModel

    public init(viewModel: GitHubSearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        SearchViewMain(state: viewModel.state, sendEvent: { viewModel.onUiEvent(event: $0) })
            .snackbar(
                show: $viewModel.state.showResult,
                message: viewModel.state.resultMessage,
                bgColor: .green
            )
    }
}

private struct SearchViewMain: View {
    let state: GitHubSearchContract.State
    let sendEvent: (_ event: GitHubSearchContract.Event) -> ()

    var body: some View {
        VStack {
            Image("gh-logo")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 30)
                .foregroundStyle(.tint)

            TextField("Username", text: Binding(
                get: { state.username },
                set: { sendEvent(.onUserNameChanged(username: $0)) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            Button(action: {
                sendEvent(.OnSearchButtonClicked)
            }) {
                Text("Search")
            }

            Button(action: {
                sendEvent(.OnLogoutButtonTapped)
            }) {
                Text("LogOut")
            }
        }
        .padding()
    }
}

#Preview {
    SearchViewMain(
        state: GitHubSearchContract.State(username: "user"), sendEvent: { _ in }
    )
}
