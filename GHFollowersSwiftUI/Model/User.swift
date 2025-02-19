//
//  User.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import UIKit

struct User: Codable {
    let login: String
    let avatarUrl: String
    let name: String?
    let location: String?
    let bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
}
