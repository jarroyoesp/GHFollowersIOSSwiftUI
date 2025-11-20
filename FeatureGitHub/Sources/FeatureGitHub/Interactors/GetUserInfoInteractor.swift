//
//  GetUserInfoInteractor.swift
//  NetworkModule
//
//  Created by Javier Arroyo on 14/11/25.
//

import NetworkModule

public protocol GetUserInfoInteractor {
    func invoke(for username: String, completed: @escaping (Result<User, GHError>) -> ())
}
