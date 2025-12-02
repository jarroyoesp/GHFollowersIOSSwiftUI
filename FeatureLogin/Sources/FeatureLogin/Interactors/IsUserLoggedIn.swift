//
//  IsUserLoggedIn.swift
//  NetworkModule
//
//  Created by Javier Arroyo on 14/11/25.
//

import NetworkModule

public protocol IsUserLoggedInInteractor {
    func invoke() -> Bool
}
