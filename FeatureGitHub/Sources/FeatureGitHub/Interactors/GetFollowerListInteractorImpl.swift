//
//  GetFollowerListInteractorImpl.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import NetworkModule

public final class GetFollowerListInteractorImpl: GetFollowerListInteractor {
    private let networkManager: NetworkManagerProtocol

    public init(
        networkManager: NetworkManagerProtocol
    ) {
        self.networkManager = networkManager
    }

    public func invoke(for username: String, page: Int) async throws -> [Follower] {
        try await networkManager.getFollowers(for: username, page: page)
    }
}
