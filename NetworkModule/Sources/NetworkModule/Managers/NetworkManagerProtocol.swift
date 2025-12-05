//
//  NetworkManagerProtocol.swift
//  NetworkModule
//
//  Created by Javier Arroyo on 14/11/25.
//

public protocol NetworkManagerProtocol: Sendable {
    func getFollowers(for username: String, page: Int) async throws -> [Follower]
    func getUserInfo(for username: String) async throws -> User
}
