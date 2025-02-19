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
        NavigationStack {
            Image("gh-logo")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 30)
                .foregroundStyle(.tint)

            TextField("Username", text: Binding(
                get: { viewModel.state.username },
                set: { viewModel.send(event: SearchEvent.onUserNameChanged(username: $0)) }
            ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            NavigationLink(
                "Search",
                destination: FollowerListView(username: viewModel.state.username)
            )
        }
        .padding()
        .onReceive(viewModel.$effect) { effect in
            guard let effect = effect else { return }
            switch effect {
            case let .showError(message): print(message)
            }
        }
    }
}

#Preview {
    SearchView()
}
