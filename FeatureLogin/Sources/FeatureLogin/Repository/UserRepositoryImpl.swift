//
//  UserRepositoryImpl.swift
//  GHFollowers
//
//  Created by Javier Arroyo on 11/2/25.
//

import NetworkModule

public class MemoryUserRepositoryImpl: UserRepository {
    private var user: String?

    public func getUser() -> String? {
        print("MemoryUserRepositoryImpl: getUser - \(user)")
        return user
    }

    public func saveUser(user: String) {
        print("MemoryUserRepositoryImpl: saveUser - \(user)")
        self.user = user
    }
}
