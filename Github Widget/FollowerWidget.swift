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
        .configurationDisplayName("My Widget")
        .description("Show data from an endpoint in a widget")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

private struct FollowerWidgetView: View {
    var entry: FollowerWidgetData

    var body: some View {
        switch entry.family {
            case .systemMedium:
                FollowerWidgetViewMedium(entry: entry)
            case .systemLarge:
                FollowerWidgetViewMedium(entry: entry)
            case .systemSmall:
                FollowerWidgetViewSmall(entry: entry)
            default:
                // NOT IMPLEMENTED
                Text("Not implemented")
        }
    }
}
