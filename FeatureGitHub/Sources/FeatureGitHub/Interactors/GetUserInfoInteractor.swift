//
//  GetUserInfoInteractor.swift
//  NetworkModule
//
//  Created by Javier Arroyo on 14/11/25.
//

import NetworkModule

public protocol GetUserInfoInteractor: Sendable {
    func invoke(for username: String) async throws -> User
}
