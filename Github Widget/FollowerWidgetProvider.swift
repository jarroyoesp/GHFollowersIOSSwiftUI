//
//  FollowerWidgetProvider.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import Foundation
import NetworkModule
import SwiftUI
import Swinject
import WidgetKit

struct ApiResponse {
    let date: Date
    let title: String
    let value: String
}

struct FollowerWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> FollowerWidgetData {
        FollowerWidgetData(date: Date(), family: context.family, followerList: [])
    }

    func getSnapshot(in context: Context, completion: @escaping (FollowerWidgetData) -> ()) {
        fetchData { data in
            let entry = FollowerWidgetData(date: Date(), family: context.family, followerList: context.family.getFollowerListe(followerList: data ?? []))
            completion(entry)
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<FollowerWidgetData>) -> ()) {
        fetchData { data in
            let entry = FollowerWidgetData(date: Date(), family: context.family, followerList: context.family.getFollowerListe(followerList: data ?? []))
            let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 1))) // Actualiza cada 1 min
            completion(timeline)
        }
    }

    // MARK: - Request al endpoint

    private func fetchData(completion: @escaping ([Follower]?) -> ()) {
        let networkManager = Container.NetworkContainer.resolve(NetworkManagerProtocol.self)
        Task {
            do {
                let followers = try await networkManager?.getFollowers(for: "jarroyoesp", page: 1)
                completion(followers)

            } catch {
                print(error)
            }
        }
    }
}
