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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

private struct FollowerHeaderWidgetViewMedium: View {
    let date: Date

    var body: some View {
        HStack {
            Text("Latest Updates \(date.getTimeString())")
                .font(.headline)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "bell.fill")
                .foregroundColor(.gray)
                .frame(alignment: .trailing)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.bottom, 4)
    }
}
