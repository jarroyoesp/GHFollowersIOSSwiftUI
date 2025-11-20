//
//  UserSettingsView.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import FeatureGitHub
import NavigationModule
import SwiftUI
import Swinject

public struct UserSettingsView: View {
    @StateObject private var viewModel: UserSettingsViewModel

    public init(viewModel: UserSettingsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        UserSettingsViewMain(state: viewModel.state, sendEvent: { viewModel.onUiEvent(event: $0) })
    }
}

private struct UserSettingsViewMain: View {
    let state: UserSettingsContract.State
    let sendEvent: (_ event: UserSettingsContract.Event) -> ()

    var body: some View {
        VStack {
            Text("UserSettings")
        }
        .padding()
    }
}

#Preview {
    UserSettingsViewMain(
        state: UserSettingsContract.State(), sendEvent: { _ in }
    )
}
