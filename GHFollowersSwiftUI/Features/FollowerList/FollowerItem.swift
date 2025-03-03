//
//  FollowerItem.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 3/3/25.
//

import Foundation
import SwiftUI

struct FollowerItem: View {
    let follower: Follower
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: follower.avatarUrl)) { phase in
                switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    case .empty:
                        ProgressView()
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    @unknown default:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                }
            }
            Text(follower.login)
                .font(.caption)
        }
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
    }
}

#Preview {
    FollowerItem(follower: Follower(id: 1, login: "Lorem Ipsum", avatarUrl: "url"))
}
