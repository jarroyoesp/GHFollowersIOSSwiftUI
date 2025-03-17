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
            .onTapGesture {
                print("Clicked on \(follower.login)")
            }
        }
    }
}
