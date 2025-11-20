
import Foundation

// MARK: - Module Routes

public enum GitHubAppRoute: Hashable {
    case profileFollowerList(profileId: String, callbackId: UUID)
    case searchProfile
    case userInfo(profileId: String)
}

public enum LoginAppRoute: Hashable {
    case login
}

public enum UserAppRoute: Hashable {
    case userSettings
}

// MARK: - Principal AppRoute

public enum AppRoute: Hashable {
    case gitHub(GitHubAppRoute)
    case login(LoginAppRoute)
    case user(UserAppRoute)
}
