//
//  FollowerListView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import NetworkModule
import SwiftUI

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
        .snackbar(
            show: $viewModel.state.showSnackbar,
            message: viewModel.state.errorMessage
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
            LazyVGrid(columns: columns, spacing: 20) {
                if state.isLoading && state.followerList.isEmpty {
                    initialLoadingPlaceholder()
                } else {
                    if !state.followerList.isEmpty {
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
                    } else {
                        Text("There is no followers for this user")
                    }
                }
            }
            .redacted(reason: state.isLoading ? .placeholder : [])
            .padding()
        }
    }
}

@ViewBuilder
private func initialLoadingPlaceholder() -> some SwiftUI.View {
    ForEach(0 ..< 20, id: \.self) { _ in
        FollowerItem(
            follower: Follower(id: 1, login: "Lorem Ipsum", avatarUrl: "url"),
            isFavorite: false,
            onClick: {},
            onClickFavorite: { _ in }
        )
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
