//
//  SnackbarModifier.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 3/3/25.
//
import SwiftUI

public struct UrlImage: View {
    let url: String

    public init(url: String) {
        print("\(url)")
        self.url = url
    }

    public var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                case .empty:
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .foregroundStyle(.gray)
                // ProgressView()
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
