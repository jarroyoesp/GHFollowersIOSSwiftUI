//
//  RootViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import AccountModule
import Combine
import DesignModule
import Foundation
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

class RootViewModel: BaseViewModel<RootContract.Event, RootContract.State, RootContract.Effect> {
    private let appFlowManager: AppFlowManager
    private var cancellables = Set<AnyCancellable>()

    init(
        appFlowManager: AppFlowManager
    ) {
        self.appFlowManager = appFlowManager
        super.init(initialState: RootContract.State())
        appFlowManager.currentStatus
            .sink { status in
                self.state.currrentState = status
            }
            .store(in: &cancellables)
    }
}
