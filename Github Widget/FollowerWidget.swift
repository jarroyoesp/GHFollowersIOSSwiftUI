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

struct FollowerWidgetView: View {
    var entry: FollowerWidgetData

    var body: some View {
        switch entry.widgetSizeType {
            case .BIG:
                FollowerWidgetViewMedium(entry: entry)
            case .MEDIUM:
                FollowerWidgetViewMedium(entry: entry)
            case .SMALL:
                FollowerWidgetViewSmall(entry: entry)
        }
    }
}
