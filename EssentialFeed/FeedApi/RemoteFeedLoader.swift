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
    public enum Error: Swift.Error
    {
        case connectivity
    }
   public init(url: URL = URL(string: "jkjkh.dafds.dssd")! , client: HTTPClient) {
        self.client = client
        self.url = url
    }
    public func load(completion: @escaping(Error) -> Void = { _ in }){
        client.get(from: url) { _ in
            completion(.connectivity)
        }
       
    }
}
public protocol HTTPClient{
    func get(from url: URL, completion: @escaping(Error)-> Void)
   
}
