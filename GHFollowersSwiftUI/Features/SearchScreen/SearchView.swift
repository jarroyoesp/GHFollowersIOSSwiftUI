//
//  SearchView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @StateObject private var navigator = Navigator.shared

    var body: some View {
        NavigationStack(path: $navigator.navigationPath) {
            SearchViewMain(state: viewModel.state, sendEvent: { viewModel.onUiEvent(event: $0) })
                .handleNavigationDestination()
                .snackbar(
                    show: $viewModel.state.showResult,
                    message: viewModel.state.resultMessage,
                    bgColor: .green
                )
        }
        .onReceive(viewModel.$effect) { effect in
            guard let effect = effect else { return }
            switch effect {
                case .showError(let message): print(message)
            }
        }
    }
}

private struct SearchViewMain: View {
    let state: SearchState
    var sendEvent: (_ event: SearchEvent) -> ()

    var body: some View {
        VStack {
            Image("gh-logo")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 30)
                .foregroundStyle(.tint)

            TextField("Username", text: Binding(
                get: { state.username },
                set: { sendEvent(SearchEvent.onUserNameChanged(username: $0)) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            Button(action: {
                sendEvent(SearchEvent.OnSearchButtonClicked)
            }) {
                Text("Search")
            }
        }
        .padding()
    }
}

#Preview {
    SearchViewMain(
        state: SearchState(username: "user"), sendEvent: { _ in }
    )
}

extension View {
    func handleNavigationDestination() -> some View {
        navigationDestination(for: AppRoute.self) { route in
            switch route {
                case .followerList(let username, let callbackId):
                    FollowerListView(userName: username, callbackId: callbackId)
            }
        }
    }
}
