//
//  FollowerListView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import SwiftUI

struct FollowerListView: View {
    let username: String
    @StateObject private var viewModel = FollowerListViewModel()

    // Definimos la estructura de las columnas (en este caso 3 columnas)
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.state.followerList) { follower in
                    VStack {
                        ItemView(follower: follower)
                        Text(follower.login)
                            .font(.caption)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                }
            }
            .padding()
        }
        .navigationTitle("Collection")
        .onAppear {
            viewModel.send(event: .OnViewDidLoad(username: username))
        }
    }
}

struct ItemView: View {
    let follower: Follower
    var body: some View {
        // Aquí asumimos que las imágenes están en el Assets de Xcode
        AsyncImage(url: URL(string: follower.avatarUrl)) { phase in
            switch phase {
            case let .success(image):
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
            case .empty:
                ProgressView()
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                Image(systemName: "photo")
            }
        }
        .frame(width: 100, height: 100) // Ajusta el tamaño de la imagen
    }
}

#Preview {
    FollowerListView(username: "user")
}
