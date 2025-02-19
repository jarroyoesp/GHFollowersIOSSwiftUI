//
//  FollowerViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Foundation

class FollowerListViewModel: BaseViewModel<FollowerListEvent, FollowerListState, FollowerListEffect> {
    private var page = 1
    init() {
        super.init(initialState: FollowerListState(isLoading: false))
    }

    override func send(event: FollowerListEvent) {
        switch event {
        case .OnLoadMoreItems:
                onLoadMoreItems()
        case .OnLoginButtonClicked:
            print("OnLoginButtonClicked: \(state.username).")
                refreshData()
        case let .onUserNameChanged(username: username):
            state.username = username
        case let .OnViewDidLoad(username: username):
            state.username = username
                refreshData()
        }
    }

    private func refreshData(page: Int = 1) {
        NetworkManager.shared.getFollowers(for: state.username, page: page) { result in
            switch result {
            case let .success(followers):
                DispatchQueue.main.async {
                    self.state.followerList.append(contentsOf: followers)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func onLoadMoreItems() {
        page += 1
        refreshData(page: page)
    }
}
