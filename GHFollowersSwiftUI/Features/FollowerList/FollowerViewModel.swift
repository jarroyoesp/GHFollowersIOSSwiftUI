//
//  FollowerViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Foundation

class FollowerListViewModel: BaseViewModel<FollowerListEvent, FollowerListState, FollowerListEffect> {
    init() {
        super.init(initialState: FollowerListState(isLoading: false))
    }

    override func send(event: FollowerListEvent) {
        switch event {
        case .OnLoginButtonClicked:
            print("OnLoginButtonClicked: \(state.username).")
            onGetData()
        case let .onUserNameChanged(username: username):
            state.username = username
        case let .OnViewDidLoad(username: username):
            state.username = username
            onGetData()
        }
    }

    private func onGetData() {
        NetworkManager.shared.getFollowers(for: state.username, page: 1) { result in
            switch result {
            case let .success(followers):
                DispatchQueue.main.async {
                    self.state.followerList = followers
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
