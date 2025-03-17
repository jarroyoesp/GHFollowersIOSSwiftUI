//
//  SnackbarModifier.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 3/3/25.
//
import SwiftUI

public struct SnackbarView: View {
    public init(
        show: Binding<Bool>,
        message: String,
        bgColor: Color = .red,
        txtColor: Color = .white,
        icon: String? = nil,
        iconColor: Color = .white,
        autoDismiss: Bool = true
    ) {
        _show = show
        self.message = message
        self.bgColor = bgColor
        self.txtColor = txtColor
        self.icon = icon
        self.iconColor = iconColor
        self.autoDismiss = autoDismiss
    }

    @Binding public var show: Bool
    private var message: String
    private var bgColor: Color
    private var txtColor: Color
    private var icon: String?
    private var iconColor: Color
    private var autoDismiss: Bool

    let paddingBottom = (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 54

    public var body: some View {
        if show {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 12) {
                    if let name = icon {
                        Image(systemName: name)
                            .resizable()
                            .foregroundColor(self.iconColor)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 14, height: 14)
                    }

                    Text(message)
                        .foregroundColor(txtColor)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .onTapGesture {
                            self.show = false
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, minHeight: 35)
                .padding(.vertical, 8)
                .background(bgColor)
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.bottom, show ? self.paddingBottom : 0)
                .animation(.easeInOut)
            }
            .transition(.move(edge: .bottom))
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                if autoDismiss {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        self.show = false
                    }
                }
            }
        }
    }
}

public extension View {
    func snackbar(
        show: Binding<Bool>,
        message: String,
        bgColor: Color = .red,
        txtColor: Color = .white,
        icon: String? = nil,
        iconColor: Color = .white,
        autoDismiss: Bool = true
    ) -> some View {
        modifier(
            SnackbarModifier(
                show: show,
                message: message,
                bgColor: bgColor,
                txtColor: txtColor,
                icon: icon,
                iconColor: iconColor,
                autoDismiss: autoDismiss
            )
        )
    }
}

public struct SnackbarModifier: ViewModifier {
    @Binding var show: Bool
    var message: String
    var bgColor: Color
    var txtColor: Color
    var icon: String?
    var iconColor: Color
    var autoDismiss: Bool

    public func body(content: Content) -> some View {
        ZStack {
            content
            SnackbarView(show: $show, message: message, bgColor: bgColor, txtColor: txtColor, icon: icon, iconColor: iconColor, autoDismiss: autoDismiss)
        }
    }
}

// struct SnackbarModifier: ViewModifier {
//    @Binding var isVisible: Bool
//    let message: String
//
//    func body(content: Content) -> some View {
//        ZStack {
//            content
//
//            if isVisible {
//                VStack {
//                    Spacer()
//                    Text(message)
//                        .padding()
//                        .background(Color.black.opacity(0.8))
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                        .padding(.bottom, 50)
//                        .transition(.move(edge: .bottom).combined(with: .opacity))
//                }
//            }
//        }
//        .animation(.easeInOut, value: isVisible)
//    }
// }
//
// extension View {
//    func snackbarOld(isVisible: Binding<Bool>, message: String) -> some View {
//        modifier(SnackbarModifier(isVisible: isVisible, message: message))
//    }
// }
//
