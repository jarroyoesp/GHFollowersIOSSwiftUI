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

enum WidgetSizeType {
    case BIG
    case MEDIUM
    case SMALL
}

struct FollowerWidgetData: TimelineEntry {
    var date: Date
    let widgetSizeType: WidgetSizeType
    var followerList: [Follower]
}

extension CGSize {
    func getWidgetSizeType() -> WidgetSizeType {
        return if width <= 170 {
            .SMALL
        } else if height > 300 {
            .BIG
        } else {
            .MEDIUM
        }
    }
}

extension Date {
    func getTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"

        return formatter.string(from: self)
    }
}

extension WidgetSizeType {
    func getFollowerListe(followerList: [Follower]) -> [Follower] {
        return switch self {
            case .BIG:
                Array(followerList.prefix(7))
            case .MEDIUM:
                Array(followerList.prefix(3))
            case .SMALL:
                Array(followerList.prefix(1))
        }
    }
}
