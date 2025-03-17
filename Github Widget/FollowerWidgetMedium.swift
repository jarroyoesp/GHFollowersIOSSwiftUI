//
//  FollowerWidgetMedium.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import DesignModule
import Foundation
import NetworkModule
import SwiftUI
import WidgetKit

struct FollowerWidgetViewMedium: View {
    var entry: FollowerWidgetData

    var body: some View {
        LazyVStack {
            FollowerHeaderWidgetViewMedium(date: entry.date)
            ForEach(entry.followerList.indices, id: \.self) { index in
                let follower = entry.followerList[index]
                FollowerItem(follower: follower)
                if index < entry.followerList.count - 1 {
                    Divider()
                }
            }
        }
    }
}

private struct FollowerHeaderWidgetViewMedium: View {
    let date: Date

    var body: some View {
        HStack {
            Text("Last Updates \(date.getTimeString())")
                .font(.body)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "star")
                .foregroundColor(.gray)
                .frame(alignment: .trailing)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 4)
    }
}
