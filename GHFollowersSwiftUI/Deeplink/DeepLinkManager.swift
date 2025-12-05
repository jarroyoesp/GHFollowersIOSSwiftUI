//
//  DeepLinkManager.swift
//  NavigationModule
//
//  Created by Javier Arroyo on 3/12/25.
//

import NavigationModule
import SwiftUI

class DeepLinkManager {
    private let handlers: [DeepLinkHandler]

    // Inyectamos todos los handlers disponibles
    init(handlers: [DeepLinkHandler]) {
        self.handlers = handlers
    }

    // Busca el primer handler que acepte la URL
    func handle(url: URL) -> (any Hashable)? {
        for handler in handlers {
            if handler.canHandle(url: url) {
                return handler.handle(url: url)
            }
        }
        return nil // Nadie supo qué hacer con esto
    }
}
