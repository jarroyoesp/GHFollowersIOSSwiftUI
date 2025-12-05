//
//  GetFollowerListInteractor.swift
//  NetworkModule
//
//  Created by Javier Arroyo on 14/11/25.
//

import NetworkModule

public protocol GetFollowerListInteractor: Sendable {
    func invoke(for username: String, page: Int) async throws -> [Follower]
}
