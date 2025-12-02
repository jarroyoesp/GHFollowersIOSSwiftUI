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
//    @StateObject var appFlowManager: AppFlowManager
//
//    init(appFlowManager: AppFlowManager) {
//        _appFlowManager = StateObject(wrappedValue: appFlowManager)
//    }
    @StateObject private var viewModel: SplashViewModel

    init(viewModel: SplashViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("GHFollowers!")
    }
}
