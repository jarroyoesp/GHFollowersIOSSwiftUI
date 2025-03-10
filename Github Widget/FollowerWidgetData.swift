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
    var followerList: [Follower]
}
