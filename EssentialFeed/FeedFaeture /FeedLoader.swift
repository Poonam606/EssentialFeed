//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by poonam on 04/02/25.
//

import Foundation
enum LoadFeedResult{
    case  success([Feeditem])
    case error(Error)
     
}
protocol FeedLoader {
    func load(completion: @escaping(LoadFeedResult) -> Void)
}
