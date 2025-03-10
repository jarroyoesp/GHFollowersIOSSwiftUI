//
//  FollowerWidget.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import DesignModule
import Foundation
import NetworkModule
import SwiftUI
import WidgetKit

struct FollowerWidget: Widget {
    let kind: String = "Github Followers"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: FollowerWidgetProvider()) { entry in
            FollowerWidgetView(entry: entry)
        }
        .configurationDisplayName("Mi Widget")
        .description("Muestra datos desde un endpoint.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct FollowerWidgetView: View {
    var entry: FollowerWidgetData

    var body: some View {
        LazyVStack {
            FollowerHeaderWidgetView()
            ForEach(entry.followerList.indices, id: \.self) { index in
                let follower = entry.followerList[index]
                FollowerItem(follower: follower)
                if index < 2 {
                    Divider()
                }
            }
        }
    }
}

struct FollowerHeaderWidgetView: View {
    var body: some View {
        HStack {
            Text("Last Updates")
                .font(.body)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct FollowerItem: View {
    let follower: Follower
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.gray)
            VStack {
                Text(follower.login)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(String(follower.id))
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
