//
//  GetAccessTokenInteractorImpl.swift
//  AccountModule
//
//  Created by Javier Arroyo on 3/2/26.
//

//
//  GetFollowerListInteractorImpl.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import NetworkModule

public final class GetAccessTokenInteractorImpl: GetAccessTokenInteractor {
    private let networkManager: NetworkManagerProtocol

    public init(
        networkManager: NetworkManagerProtocol
    ) {
        self.networkManager = networkManager
    }

    public func invoke() async throws -> String {
        try await "Access Token"
    }
}
