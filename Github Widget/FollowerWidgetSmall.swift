//
//  FollowerWidgetSmall.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import DesignModule
import Foundation
import NetworkModule
import SwiftUI
import WidgetKit

struct FollowerWidgetViewSmall: View {
    var entry: FollowerWidgetData

    var body: some View {
        LazyVStack {
            FollowerHeaderWidgetViewSmall(date: entry.date)
            Image(systemName: "bell.fill")
                .frame(alignment: .trailing)
                .padding(.vertical, 8)
            Text("You have \(entry.followerList.count) followers")
                .font(.body)
        }
    }
}

private struct FollowerHeaderWidgetViewSmall: View {
    let date: Date

    var body: some View {
        HStack {
            Text("Updates")
                .font(.body)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 4)
        }
    }
}
