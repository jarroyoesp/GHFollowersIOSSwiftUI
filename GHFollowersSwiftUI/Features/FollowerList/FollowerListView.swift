//
//  FollowerListView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

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
        .navigationTitle("Collection")
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
                ForEach(state.followerList) { follower in
                    VStack {
                        FollowerItem(follower: follower)
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
