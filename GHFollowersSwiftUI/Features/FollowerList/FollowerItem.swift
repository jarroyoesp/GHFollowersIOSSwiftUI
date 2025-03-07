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
    let isFavorite: Bool
    let onClick: () -> ()
    let onClickFavorite: (_ expertId: String) -> ()

    var body: some View {
        VStack {
            UrlImage(url: follower.avatarUrl)
            HStack {
                Text(follower.login)
                    .lineLimit(1)

                Spacer()

                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        onClickFavorite(follower.login)
                    }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
        .onTapGesture {
            onClick()
        }
    }
}

#Preview {
    FollowerItem(follower: Follower(id: 1, login: "Lorem Ipsum", avatarUrl: "url"), isFavorite: false, onClick: {}, onClickFavorite: { _ in })
}
