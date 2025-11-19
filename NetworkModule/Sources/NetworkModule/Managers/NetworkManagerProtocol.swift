//
//  NetworkManagerProtocol.swift
//  NetworkModule
//
//  Created by Javier Arroyo on 14/11/25.
//

public protocol NetworkManagerProtocol {
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GHError>) -> ())
    func getUserInfo(for username: String, completed: @escaping (Result<User, GHError>) -> ())
}
