//
//  ProfilePicture.swift
//
//  Created by Javier Arroyo on 20/11/25.
//

import Kingfisher
import SwiftUI
import UIKit

public struct ProfilePicture: View {
    // MARK: - Properties

    private let imageUrl: String?
    private let size: CGFloat

    // MARK: - Init

    public init(
        imageUrl: String?,
        size: CGFloat = Padding.p56
    ) {
        self.imageUrl = imageUrl
        self.size = size
    }

    // MARK: - Body

    public var body: some View {
        if let imageUrl, !imageUrl.isEmpty {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: size, height: size)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ProfilePicture(
        imageUrl: "https://picsum.photos/200"
    )
}
