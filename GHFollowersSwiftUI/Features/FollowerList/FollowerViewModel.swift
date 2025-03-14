//
//  FollowerViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import Foundation
import NetworkModule
import SwiftUI

class FollowerListViewModel: BaseViewModel<FollowerListEvent, FollowerListState, FollowerListEffect> {
    private let username: String
    private var page = 1

    init(username: String) {
        self.username = username
        super.init(initialState: FollowerListState(username: username))
        refreshData()
    }

    override func send(event: FollowerListEvent) {
        switch event {
            case .OnFavoriteItemClicked(username: let username):
                handleOnFavoriteItemClicked(username: username)
            case .OnItemClicked(username: let username):
                handleOnItemClicked(username: username)
            case .OnLoadMoreItems:
                onLoadMoreItems()
        }
    }

    private func handleOnFavoriteItemClicked(username: String) {
        print("OnFavoriteItemClicked \(username)")
        let isFav = state.favoriteFollowers[username] ?? false
        self.state.favoriteFollowers[username] = !isFav
    
    }

    private func handleOnItemClicked(username: String) {
        print("Navigate to FollowerDetailRoute \(username)")
        navigator.navigateTo(AppRoute.followerList(username: username))
    }

    private func refreshData(page: Int = 1) {
        self.state.showSnackbar = false
        self.state.isLoading = true
        NetworkManager.shared.getFollowers(for: username, page: page) { result in
            print("Result for \(self.state.username): \n \(result)")
            switch result {
                case .success(let followers):
                    DispatchQueue.main.async {
                        self.state.followerList.append(contentsOf: followers)
                    }
                case .failure(let error):
                    print(error)
                    DispatchQueue.main.async {
                        self.state.showSnackbar = true
                        self.state.errorMessage = error.localizedDescription
                    }
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
