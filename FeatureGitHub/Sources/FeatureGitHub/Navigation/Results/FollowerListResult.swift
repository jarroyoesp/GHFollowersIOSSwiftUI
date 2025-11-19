//
//  FollowerListResult.swift
//  FeatureGitHub
//
//  Created by Javier Arroyo on 18/11/25.
//

import NavigationModule

public struct FollowerListResult: RouteResult {
    let followerId: String
    let resultType: ResultType

    public init(followerId: String, resultType: ResultType) {
        self.followerId = followerId
        self.resultType = resultType
    }

    public enum ResultType {
        case CREATE
        case UPDATE
    }
}
