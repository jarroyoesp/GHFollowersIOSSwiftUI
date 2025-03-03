//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    let pageSize = 30
    private init() {}

    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GHError>) -> ()) {
        let endpoint = baseUrl + "\(username)/followers?perpage=\(pageSize)&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(Result.failure(.invalidUserName))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(Result.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(Result.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(Result.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(Result.success(followers))
            } catch {
                completed(Result.failure(.invalidData))
            }
        }
        task.resume()
    }

    func getUserInfo(for username: String, completed: @escaping (Result<User, GHError>) -> ()) {
        let endpoint = baseUrl + "\(username)"
        guard let url = URL(string: endpoint) else {
            completed(Result.failure(.invalidUserName))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(Result.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(Result.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(Result.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completed(Result.success(user))
            } catch {
                completed(Result.failure(.invalidData))
            }
        }
        task.resume()
    }
}
