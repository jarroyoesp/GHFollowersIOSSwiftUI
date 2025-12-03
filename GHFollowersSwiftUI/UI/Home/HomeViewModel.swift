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

    private let appNavigatorTab1: AppNavigator
    init(
        appNavigatorTab1: AppNavigator
    ) {
        self.appNavigatorTab1 = appNavigatorTab1
        super.init(initialState: HomeContract.State())
    }

    override func send(event: HomeContract.Event) {
        switch event {
        case .onOpenURL(url: let url):
            handleDeepLink(url)
        }
    }
    
    private func handleDeepLink(_ url: URL) {
            // Supongamos URLs tipo:
            // myapp://profile
            // myapp://product?id=123
            
            guard let scheme = url.scheme, scheme == "myapp" else { return }
            
            // 1. Limpiamos la navegación actual para ir al destino (opcional)
            // state.navigationPath = NavigationPath()
            
            switch url.host {
            case "search":
               let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
               if let user = components?.queryItems?.first(where: { $0.name == "user" })?.value {
                   appNavigatorTab1.navigateTo(.gitHub(GitHubAppRoute.profileFollowerList(profileId: user, callbackId: UUID())))
               }
                
            default:
                print("Deep link no reconocido")
            }
        }
}
