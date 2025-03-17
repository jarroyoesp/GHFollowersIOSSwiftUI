//
//  FollowerWidgetItem.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 7/3/25.
//

import DesignModule
import Foundation
import NetworkModule
import SwiftUI
import WidgetKit

struct FollowerItem: View {
    let follower: Follower
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .foregroundColor(.gray)
            // UrlImage(url: follower.avatarUrl)
            //     .frame(width: 24, height: 24)
            VStack {
                Text(follower.login)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                Text(String(follower.id))
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
