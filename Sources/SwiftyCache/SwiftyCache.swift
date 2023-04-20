//
//  SwiftyCache.swift
//  Freex
//
//  Created by Antonio Guerra on 18/04/23.
//

import Foundation

public final class SwiftyCache<Key: Hashable, Value> {
    
    private let wrapped = NSCache<SwiftyCacheKey<Key>, SwiftyCacheValue<Value>>()
    private var tracker = Set<Key>()
    
    public func set(_ value: Value, for key: Key) {
        let wrappedKey = SwiftyCacheKey(key)
        let wrappedValue = SwiftyCacheValue(value, hash: wrappedKey.hash)
        wrapped.setObject(wrappedValue, forKey: wrappedKey)
        tracker.insert(key)
    }
        
    public func get(_ key: Key) -> Value? {
        
        guard tracker.contains(key) else {
            return nil
        }
        
        let wrappedKey = SwiftyCacheKey(key)
        guard let wrappedValue = wrapped.object(forKey: wrappedKey) else {
            tracker.remove(key)
            return nil
        }
        
        return wrappedValue.wrapped
    }
    
    public func get() -> [Value] {
        tracker.compactMap({ get($0) })
    }
    
    public func delete(_ key: Key) {
        let wrappedKey = SwiftyCacheKey(key)
        wrapped.removeObject(forKey: wrappedKey)
        tracker.remove(key)
    }
    
    public func deleteAll() {
        wrapped.removeAllObjects()
        tracker.removeAll()
    }
    
    public subscript(key: Key) -> Value? {
        get { return get(key) }
        set {
            guard let value = newValue else {
                delete(key)
                return
            }
            
            set(value, for: key)
        }
    }
}
