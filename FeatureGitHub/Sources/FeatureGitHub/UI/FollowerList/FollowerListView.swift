//
//  FollowerListView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import NavigationModule
import NetworkModule
import SwiftUI

public struct FollowerListView: View {
    @StateObject private var viewModel: FollowerListViewModel

    // init(userName: String, callbackId: UUID, appNavigator: AppNavigator?) {
    //    _viewModel = StateObject(wrappedValue: FollowerListViewModel(username: userName, callbackId: callbackId, appNavigator: appNavigator))
    // }

    init(viewModel: FollowerListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        FollowerListViewMain(
            state: viewModel.state, sendEvent: { viewModel.onUiEvent(event: $0) }
        )
        .navigationTitle(viewModel.state.username)
        .snackbar(
            show: $viewModel.state.showSnackbar,
            message: viewModel.state.errorMessage
        )
        .snackbar(
            show: $viewModel.state.showResult,
            message: viewModel.state.resultMessage,
            bgColor: .green
        )
    }
}

private struct FollowerListViewMain: View {
    let state: FollowerListContract.State
    let sendEvent: (_ event: FollowerListContract.Event) -> ()

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    if state.isLoading && state.followerList.isEmpty {
                        initialLoadingPlaceholder()
                    } else {
                        if !state.followerList.isEmpty {
                            ForEach(state.followerList) { follower in
                                FollowerItem(
                                    follower: follower,
                                    isFavorite: state.favoriteFollowers[follower.login] == true,
                                    onClick: { sendEvent(.OnItemClicked(username: follower.login)) },
                                    onClickFavorite: { sendEvent(.OnFavoriteItemClicked(username: $0)) }
                                )
                                .onAppear {
                                    if follower == state.followerList.last {
                                        sendEvent(.OnLoadMoreItems)
                                    }
                                }
                            }
                        }
                    }
                }
                .redacted(reason: state.isLoading ? .placeholder : [])
                .padding()

                if !state.isLoading && state.followerList.isEmpty {
                    Text("There is no followers for this user")
                }
            }
            Button(action: {
                sendEvent(.SendResultAndNavigateBack)
            }) {
                Text("Send Result Back")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
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
    FollowerListViewMain(state: FollowerListContract.State(followerList: getPlaceholderData()), sendEvent: { _ in })
}
