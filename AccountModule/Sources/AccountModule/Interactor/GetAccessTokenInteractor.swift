//
//  GetAccessTokenInteractor.swift
//  AccountModule
//
//  Created by Javier Arroyo on 3/2/26.
//

//  IsUserLoggedIn.swift
//  NetworkModule
//
//  Created by Javier Arroyo on 14/11/25.
//

import NetworkModule

public protocol GetAccessTokenInteractor: Sendable {
    func invoke() async throws -> String
}
