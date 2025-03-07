//
//  FollowerListView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import SwiftUI
import NetworkModule

struct FollowerListView: View {
    @StateObject private var viewModel: FollowerListViewModel

    init(userName: String) {
        _viewModel = StateObject(wrappedValue: FollowerListViewModel(username: userName))
    }

    var body: some View {
        FollowerListViewMain(
            state: viewModel.state, sendEvent: { viewModel.onUiEvent(event: $0) }
        )
        .navigationTitle(viewModel.state.username)
        .overlay(
            VStack {
                if viewModel.state.showSnackbar {
                    Text("Mensaje de Toast")
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .padding(.bottom, 50)
                }
            },
            alignment: .bottom
        )
    }
}

private struct FollowerListViewMain: View {
    let state: FollowerListState
    var sendEvent: (_ event: FollowerListEvent) -> ()

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        ScrollView {
            if state.isLoading || !state.followerList.isEmpty {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(state.followerList) { follower in
                        VStack {
                            FollowerItem(
                                follower: follower,
                                isFavorite: state.favoriteFollowers[follower.login] == true,
                                onClick: { sendEvent(FollowerListEvent.OnItemClicked(username: follower.login)) },
                                onClickFavorite: { sendEvent(FollowerListEvent.OnFavoriteItemClicked(username: $0)) }
                            )
                        }
                        .onAppear {
                            if follower == state.followerList.last {
                                sendEvent(FollowerListEvent.OnLoadMoreItems)
                            }
                        }
                    }
                }
                .redacted(reason: state.isLoading ? .placeholder : [])
                .padding()
            } else {
                Text("There is no followers for this user")
            }
        }
    }
}

private func getPlaceholderData() -> [Follower] {
    [
        Follower(id: 1, login: "Lorem Ipsum", avatarUrl: "url"),
        Follower(id: 2, login: "Lorem Ipsum", avatarUrl: "url"),
        Follower(id: 3, login: "Lorem Ipsum", avatarUrl: "url"),
        Follower(id: 4, login: "Lorem Ipsum", avatarUrl: "url"),
        Follower(id: 5, login: "Lorem Ipsum", avatarUrl: "url"),
    ]
}

#Preview {
    FollowerListViewMain(state: FollowerListState(followerList: getPlaceholderData()), sendEvent: { _ in })
}
