//
//  SnackbarModifier.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 3/3/25.
//
import SwiftUI

struct UrlImage: View {
    let url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
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
    }
}
