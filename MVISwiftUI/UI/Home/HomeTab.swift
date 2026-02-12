//
//  HomeTab.swift
//  GHFollowersSwiftUI
//
//  Created by Javier Arroyo on 27/1/26.
//

public enum HomeTab: Equatable, Hashable {
    case tab1GitHub
    case tab2UserSettings

    var title: String {
        switch self {
            case .tab1GitHub:
                return "GitHub"
            case .tab2UserSettings:
                return "User Settings"
        }
    }

    var systemImage: String {
        switch self {
            case .tab1GitHub: return "house"
            case .tab2UserSettings: return "gear"
        }
    }
}
