//
//  GetUserInfoInteractorImpl.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import NetworkModule

public final class GetUserInfoInteractorImpl: GetUserInfoInteractor {
    private let networkManager: NetworkManagerProtocol

    public init(
        networkManager: NetworkManagerProtocol
    ) {
        self.networkManager = networkManager
    }

    public func invoke(for username: String) async throws -> User {
        try await networkManager.getUserInfo(for: username)
    }
}
