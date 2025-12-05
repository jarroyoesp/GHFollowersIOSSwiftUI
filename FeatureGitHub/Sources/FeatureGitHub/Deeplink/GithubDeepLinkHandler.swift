//
//  GithubDeepLinkHandler.swift
//  FeatureGitHub
//
//  Created by Javier Arroyo on 3/12/25.
//

import NavigationModule
import SwiftUI

public class GithubDeepLinkHandler: DeepLinkHandler {
    public init() {}

    public func canHandle(url: URL) -> Bool {
        return url.scheme == "ghFollowersApp" && url.host == "search"
    }

    public func handle(url: URL) -> any Hashable {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let user = components?.queryItems?.first(where: { $0.name == "user" })?.value
        return GitHubAppRoute.profileFollowerList(profileId: user ?? "", callbackId: UUID())
    }
}
