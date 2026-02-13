//
//  GithubDeepLinkHandler.swift
//  FeatureGitHub
//
//  Created by Javier Arroyo on 3/12/25.
//

import NavigationModule
import SwiftUI

public class UserSettingsDeepLinkHandler: DeepLinkHandler {
    public init() {}

    public func canHandle(url: URL) -> Bool {
        return url.scheme == "ghFollowersApp" && url.host == "userSettings"
    }

    public func handle(url: URL) -> any Hashable {
        return UserAppRoute.userSettings
    }
}
