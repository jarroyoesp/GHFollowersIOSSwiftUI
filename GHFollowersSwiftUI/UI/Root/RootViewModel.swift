//
//  RootViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

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
        checkStatus()
    }

    override func send(event: RootContract.Event) {
        switch event {}
    }

    private func checkStatus() {
        // DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
        //    self?.state.currrentState = .main
        // }

        appFlowManager.currentStatus
            .sink { status in
                self.state.currrentState = status
            }
            .store(in: &cancellables)
    }
}
