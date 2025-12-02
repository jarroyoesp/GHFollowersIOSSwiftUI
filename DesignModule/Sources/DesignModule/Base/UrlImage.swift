//
//  SnackbarModifier.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 3/3/25.
//
import Kingfisher
import SwiftUI

public struct UrlImage: View {
    let url: String

    public init(url: String) {
        print("\(url)")
        self.url = url
    }

    public var body: some View {
        KFImage(URL(string: url))
            .placeholder {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
            }
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
    }
}
