//
//  SwiftyCacheKey.swift
//  Freex
//
//  Created by Antonio Guerra on 18/04/23.
//

import Foundation

final class SwiftyCacheKey<Wrapped: Hashable>: NSObject {
    let wrapped: Wrapped
    
    init(_ wrapped: Wrapped) {
        self.wrapped = wrapped
    }
    
    override var hash: Int {
        return wrapped.hashValue
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let key = object as? SwiftyCacheKey else {
            return false
        }
        return key.wrapped == wrapped
    }
}
