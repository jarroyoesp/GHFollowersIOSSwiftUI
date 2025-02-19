//
//  Follower.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import UIKit

struct Follower: Codable, Hashable, Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
}
