//
//  Cache.swift
//  
//
//  Created by Antonio Guerra on 19/05/23.
//

import Foundation

public struct Cache {
    private init() {}
    
    public static let image: URLCache = URLCache(memoryCapacity: 256*1024*1024, diskCapacity: 512*1024*1024, diskPath: "SwiftyCache-Image")
    public static let network: URLCache = URLCache(memoryCapacity: 256*1024*1024, diskCapacity: 512*1024*1024, diskPath: "SwiftyCache-Network")
}
