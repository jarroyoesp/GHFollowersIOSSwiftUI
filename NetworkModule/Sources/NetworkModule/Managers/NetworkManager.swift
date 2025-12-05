//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import UIKit

public final class NetworkManager: NetworkManagerProtocol {
    private let baseUrl = "https://api.github.com/users/"
    let pageSize = 30

    public init() {}

    public func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endpoint = baseUrl + "\(username)/followers?perpage=\(pageSize)&page=\(page)"

        guard let url = URL(string: endpoint) else {
            throw GHError.invalidUserName
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([Follower].self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }

    public func getUserInfo(for username: String) async throws -> User {
        let endpoint = baseUrl + "\(username)"

        guard let url = URL(string: endpoint) else {
            throw GHError.invalidUserName
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(User.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
}
