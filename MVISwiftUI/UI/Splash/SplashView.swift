//
//  SplashView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 18/11/25.
//

import FeatureLogin
import NavigationModule
import SwiftUI
import Swinject

struct SplashView: View {
    @ObservedObject private var viewModel: SplashViewModel

    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("MVI SwiftUI!")
    }
}
