//
//  UserInfoView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import FeatureGitHub
import NavigationModule
import SwiftUI
import Swinject

public struct UserInfoView: View {
    @StateObject private var viewModel: UserInfoViewModel

    init(viewModel: UserInfoViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        UserInfoViewMain(state: viewModel.state, sendEvent: { viewModel.onUiEvent(event: $0) })
    }
}

private struct UserInfoViewMain: View {
    let state: UserInfoContract.State
    let sendEvent: (_ event: UserInfoContract.Event) -> ()

    var body: some View {
        VStack {
            Text("USER \(state.user)")
        }
        .padding()
    }
}

#Preview {
    UserInfoViewMain(
        state: UserInfoContract.State(username: "user"), sendEvent: { _ in }
    )
}
