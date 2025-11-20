//  RouteCallbackRegistry.swift
//
//  Created by Javier Arroyo on 20/11/25.
//

import SwiftUI

public protocol RouteResult {}

public final class RouteCallbackRegistry {
    @MainActor public static let shared = RouteCallbackRegistry()

    private var callbacks: [UUID: (RouteResult) -> ()] = [:]
    private let lock = NSLock()

    public func register(callback: @escaping (RouteResult) -> ()) -> UUID {
        let id = UUID()
        lock.lock()
        callbacks[id] = callback
        lock.unlock()
        return id
    }

    public func trigger(id: UUID, result: RouteResult) {
        var callback: ((RouteResult) -> ())?
        lock.lock()
        callback = callbacks[id]
        callbacks.removeValue(forKey: id)
        lock.unlock()

        callback?(result)
    }
}
