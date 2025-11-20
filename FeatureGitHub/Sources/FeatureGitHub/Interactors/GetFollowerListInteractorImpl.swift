//
//  GetFollowerListInteractorImpl.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import NetworkModule

public class GetFollowerListInteractorImpl: GetFollowerListInteractor {
    private let networkManager: NetworkManagerProtocol

    public init(
        networkManager: NetworkManagerProtocol
    ) {
        self.networkManager = networkManager
    }

    public func invoke(for username: String, page: Int, completed: @escaping (Result<[Follower], GHError>) -> ()) {
        networkManager.getFollowers(for: username, page: page, completed: completed)
    }
}
