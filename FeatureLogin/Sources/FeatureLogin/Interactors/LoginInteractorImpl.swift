//
//  LoginInteractorImpl.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import NetworkModule

public class LoginInteractorImpl: LoginInteractor {
    private let userRepository: UserRepository

    public init(
        userRepository: UserRepository
    ) {
        self.userRepository = userRepository
    }

    public func invoke(for username: String, completed: @escaping (Result<String, GHError>) -> ()) {
        userRepository.saveUser(user: username)
        completed(.success(username))
    }
}
