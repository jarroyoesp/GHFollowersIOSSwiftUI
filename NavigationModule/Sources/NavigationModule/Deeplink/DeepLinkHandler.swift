//
//  DeepLinkHandler.swift
//  NavigationModule
//
//  Created by Javier Arroyo on 3/12/25.
//


import SwiftUI

public protocol DeepLinkHandler {
    func canHandle(url: URL) -> Bool
    func handle(url: URL) -> any Hashable
}
