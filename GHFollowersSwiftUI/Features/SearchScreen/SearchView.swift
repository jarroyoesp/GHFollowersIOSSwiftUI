//
//  SearchView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            SearchViewMain(state: viewModel.state, sendEvent: { viewModel.onUiEvent(event: $0) })
                .navigationDestination(for: FollowerListRoute.self) { route in
                    FollowerListView(userName: route.username)
                }
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
