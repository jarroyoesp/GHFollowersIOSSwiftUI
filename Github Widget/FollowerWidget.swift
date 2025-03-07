//
//  FollowerWidget.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import Foundation
import SwiftUI
import WidgetKit
import DesignModule

struct FollowerWidgetView: View {
    var entry: MyWidgetEntry

    var body: some View {
        HStack {
            UrlImage(url: entry.value)
            Text(entry.title)
                .font(.headline)
            //Text(entry.value)
            //    .font(.largeTitle)
            //    .foregroundColor(.blue)
        }
        .padding()
    }
}

struct FollowerWidget: Widget {
    let kind: String = "Github Followers"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MyWidgetProvider()) { entry in
            FollowerWidgetView(entry: entry)
        }
        .configurationDisplayName("Mi Widget")
        .description("Muestra datos desde un endpoint.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
