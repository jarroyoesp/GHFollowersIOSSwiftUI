//
//  FollowerViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import Foundation

class FollowerListViewModel: BaseViewModel<FollowerListEvent, FollowerListState, FollowerListEffect> {
    private let username: String
    private var page = 1

    init(username: String) {
        self.username = username
        super.init(initialState: FollowerListState(isLoading: false))
        refreshData()
    }

    override func send(event: FollowerListEvent) {
        switch event {
            case .OnLoadMoreItems:
                onLoadMoreItems()
        }
    }

    private func refreshData(page: Int = 1) {
        DispatchQueue.main.async {
            self.state.isLoading = true
        }
        NetworkManager.shared.getFollowers(for: username, page: page) { result in
            switch result {
                case .success(let followers):
                    DispatchQueue.main.async {
                        self.state.followerList.append(contentsOf: followers)
                    }
                case .failure(let error):
                    print(error)
            }
            DispatchQueue.main.async {
                self.state.isLoading = false
            }
        }
    }

    private func onLoadMoreItems() {
        page += 1
        refreshData(page: page)
    }
}
