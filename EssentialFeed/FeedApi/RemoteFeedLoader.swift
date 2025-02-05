//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by poonam on 05/02/25.
//

import Foundation
public final class RemoteFeedLoader {
   private let url: URL
   private let client: HTTPClient
   public init(url: URL = URL(string: "jkjkh.dafds.dssd")! , client: HTTPClient) {
        self.client = client
        self.url = url
    }
   public func load(){
        client.get(from: url)
       
    }
}
public protocol HTTPClient{
    func get(from url: URL)
   
}
