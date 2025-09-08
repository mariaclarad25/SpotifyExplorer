//
//  ImageCacheConfig.swift
//  SpotifyExplorer
//
//  Created by Maria Clara Dias on 05/09/25.
//

import Kingfisher

func configureImageCache() {
    let cache = ImageCache.default
    
    cache.memoryStorage.config.totalCostLimit = 1024 * 1024 * 40
    
    cache.memoryStorage.config.expiration = .seconds(60)
    
    cache.memoryStorage.config.cleanInterval = 15
    
    cache.diskStorage.config.sizeLimit = 1024 * 1024 * 200
    
    cache.diskStorage.config.expiration = .days(3)
}
