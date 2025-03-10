//
//  Follower.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import UIKit

public struct Follower: Codable, Hashable, Identifiable {
    public let id: Int
    public let login: String
    public let avatarUrl: String

    public init(id: Int, login: String, avatarUrl: String) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
}
