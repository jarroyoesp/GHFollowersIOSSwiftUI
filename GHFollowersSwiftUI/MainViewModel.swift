//
//  MainViewModel.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 19/2/25.
//

import DesignModule
import Foundation
import NavigationModule
import NetworkModule
import SwiftUI
import Swinject

class MainViewModel: BaseViewModel<MainEvent, MainState, MainEffect> {
    init() {
        super.init(initialState: MainState())
    }

    override func send(event: MainEvent) {
        switch event {}
    }
}
