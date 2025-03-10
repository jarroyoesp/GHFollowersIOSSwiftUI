//
//  FollowerWidgetProvider.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import Foundation
import NetworkModule
import SwiftUI
import WidgetKit

struct ApiResponse {
    let date: Date
    let title: String
    let value: String
}

struct FollowerWidgetProvider: TimelineProvider {
    func placeholder(in _: Context) -> FollowerWidgetData {
        FollowerWidgetData(date: Date(), followerList: [])
    }

    func getSnapshot(in _: Context, completion: @escaping (FollowerWidgetData) -> ()) {
        fetchData { data in
            let entry = FollowerWidgetData(date: Date(), followerList: Array((data ?? []).prefix(3)))
            completion(entry)
        }
    }

    func getTimeline(in _: Context, completion: @escaping (Timeline<FollowerWidgetData>) -> ()) {
        fetchData { data in
            let entry = FollowerWidgetData(date: Date(), followerList: Array((data ?? []).prefix(3)))
            let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 1))) // Actualiza cada 1 min
            completion(timeline)
        }
    }

    // MARK: - Request al endpoint

    private func fetchData(completion: @escaping ([Follower]?) -> ()) {
        NetworkManager.shared.getFollowers(for: "jarroyoesp", page: 1) { result in
            switch result {
                case .success(let followers):
                    print("Success: \(followers)")
                    DispatchQueue.main.async {
                        completion(followers)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
