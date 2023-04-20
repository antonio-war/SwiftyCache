//
//  SwiftyCacheValue.swift
//  Freex
//
//  Created by Antonio Guerra on 18/04/23.
//

import Foundation

final class SwiftyCacheValue<Wrapped>: NSObject {
    let wrapped: Wrapped
    let keyHash: Int
    
    init(_ wrapped: Wrapped, hash: Int) {
        self.wrapped = wrapped
        self.keyHash = hash
    }
}
