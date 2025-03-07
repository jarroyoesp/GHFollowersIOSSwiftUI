//
//  SnackbarModifier.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 3/3/25.
//
import SwiftUI

struct SnackbarModifier: ViewModifier {
    @Binding var isVisible: Bool
    let message: String

    func body(content: Content) -> some View {
        ZStack {
            content

            if isVisible {
                VStack {
                    Spacer()
                    Text(message)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
        .animation(.easeInOut, value: isVisible)
    }
}

extension View {
    func snackbar(isVisible: Binding<Bool>, message: String) -> some View {
        modifier(SnackbarModifier(isVisible: isVisible, message: message))
    }
}
