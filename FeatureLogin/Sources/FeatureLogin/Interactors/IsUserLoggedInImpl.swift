//
//  IsUserLoggedInImpl.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import NetworkModule

public class IsUserLoggedInInteractorImpl: IsUserLoggedInInteractor {
    private let userRepository: UserRepository

    public init(
        userRepository: UserRepository
    ) {
        self.userRepository = userRepository
    }

    public func invoke() -> Bool {
        userRepository.getUser() != nil
    }
}
