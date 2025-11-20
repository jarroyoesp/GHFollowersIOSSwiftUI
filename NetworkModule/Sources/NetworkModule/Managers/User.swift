//
//  User.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import UIKit

public struct User: Codable {
    public let login: String
    public let avatarUrl: String
    public let name: String?
    public let location: String?
    public let bio: String?
    public let publicRepos: Int
    public let publicGists: Int
    public let htmlUrl: String
    public let following: Int
    public let followers: Int
    public let createdAt: String
}
