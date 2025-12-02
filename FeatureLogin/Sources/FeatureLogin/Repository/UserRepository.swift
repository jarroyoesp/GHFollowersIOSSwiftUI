//
//  UserRepository.swift
//  NetworkModule
//
//  Created by Javier Arroyo on 14/11/25.
//

import NetworkModule

public protocol UserRepository {
    func getUser() -> String?
    func saveUser(user: String)
}
