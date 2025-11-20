//
//  GetFollowerListInteractor.swift
//  NetworkModule
//
//  Created by Javier Arroyo on 14/11/25.
//

import NetworkModule

public protocol GetFollowerListInteractor {
    func invoke(for username: String, page: Int, completed: @escaping (Result<[Follower], GHError>) -> ())
}
