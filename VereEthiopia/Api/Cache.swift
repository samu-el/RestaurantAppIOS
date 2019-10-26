//
//  Cache.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/26/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit

import CodableCache

struct CachedData: Codable {
    let restaurants: [Restaurant]
    let categories: [Category]

}


final class GenericCache<Cacheable: Codable> {
    
    let cache: CodableCache<Cacheable>
    
    init(cacheKey: AnyHashable) {
        self.cache = CodableCache<Cacheable>(key: cacheKey)
    }
    
    func get() -> Cacheable? {
        return self.cache.get()
    }
    
    func set(value: Cacheable) throws {
        try self.cache.set(value: value)
    }
    
    func clear() throws {
        try self.cache.clear()
    }
}
