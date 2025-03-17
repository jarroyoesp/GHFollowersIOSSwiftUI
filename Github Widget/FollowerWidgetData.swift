//
//  FollowerWidgetData.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import Foundation
import NetworkModule
import SwiftUI
import WidgetKit

struct FollowerWidgetData: TimelineEntry {
    var date: Date
    let family: WidgetFamily
    var followerList: [Follower]
}

extension Date {
    func getTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"

        return formatter.string(from: self)
    }
}

extension WidgetFamily {
    func getFollowerListe(followerList: [Follower]) -> [Follower] {
        return switch self {
            case .systemLarge:
                Array(followerList.prefix(7))
            case .systemMedium:
                Array(followerList.prefix(3))
            case .systemSmall:
                Array(followerList.prefix(1))
            default:
                // NOT IMPLEMENTED
                []
        }
    }
}
