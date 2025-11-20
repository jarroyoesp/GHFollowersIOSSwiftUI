//
//  GetUserInfoInteractorImpl.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import NetworkModule

public class GetUserInfoInteractorImpl: GetUserInfoInteractor {
    private let networkManager: NetworkManagerProtocol

    public init(
        networkManager: NetworkManagerProtocol
    ) {
        self.networkManager = networkManager
    }

    public func invoke(for username: String, completed: @escaping (Result<User, GHError>) -> ()) {
        networkManager.getUserInfo(for: username, completed: completed)
    }
}
