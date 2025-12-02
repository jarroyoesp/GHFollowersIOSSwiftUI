//
//  HomeViewModel.swift
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

class HomeViewModel: BaseViewModel<HomeContract.Event, HomeContract.State, HomeContract.Effect> {
    init() {
        super.init(initialState: HomeContract.State())
    }

    override func send(event: HomeContract.Event) {
        switch event {}
    }
}
