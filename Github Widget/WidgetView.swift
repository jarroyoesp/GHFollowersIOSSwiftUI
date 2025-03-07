//
//  WidgetView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import Foundation
import SwiftUI
import WidgetKit

// MARK: - Modelo de datos para el Widget
struct MyWidgetEntry: TimelineEntry {
    let date: Date
    let title: String
    let value: String
}
