//
//  WidgetProvider.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import Foundation
import WidgetKit
import SwiftUI
import NetworkModule

struct ApiResponse {
    let date: Date
    let title: String
    let value: String
}

struct MyWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> MyWidgetEntry {
        MyWidgetEntry(date: Date(), title: "Cargando...", value: "...")
    }

    func getSnapshot(in context: Context, completion: @escaping (MyWidgetEntry) -> Void) {
        fetchData { data in
            let entry = MyWidgetEntry(date: Date(), title: data?.title ?? "Error", value: data?.value ?? "N/A")
            completion(entry)
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MyWidgetEntry>) -> Void) {
        fetchData { data in
            let entry = MyWidgetEntry(date: Date(), title: data?.title ?? "Error", value: data?.value ?? "N/A")
            let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 15))) // Actualiza cada 15 min
            completion(timeline)
        }
    }

    // MARK: - Request al endpoint
    private func fetchData(completion: @escaping (ApiResponse?) -> Void) {
        //DispatchQueue.main.async {
        //    completion(ApiResponse(date: Date(), title: "Title JAE", value: "Value JAE"))
        //}
        //guard let url = URL(string: "https://api.ejemplo.com/data") else {
        //    completion(nil)
        //    return
        //}
//
        //URLSession.shared.dataTask(with: url) { data, _, _ in
        //    if let data = data {
        //        let decoded = try? JSONDecoder().decode(ApiResponse.self, from: data)
        //        DispatchQueue.main.async {
        //            completion(decoded)
        //        }
        //    } else {
        //        completion(nil)
        //    }
        //}.resume()
        NetworkManager.shared.getFollowers(for: "jarroyoesp", page: 1) { result in
            switch result {
                case .success(let followers):
                    DispatchQueue.main.async {
                        completion(ApiResponse(date: Date(), title: followers.first?.login ?? "Empty", value: followers.first?.avatarUrl ?? "Empty"))
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}

