//
//  RemoteFeedLoadertests.swift
//  EssentialFeedTests
//
//  Created by poonam on 04/02/25.
//

import Foundation
import XCTest
class RemoteFeedLoader {
    let client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    func load(){
        client.get(from: URL(string: "jkjkh.dafds.dssd")!)
       
    }
}
protocol HTTPClient{
   
   
    func get(from url: URL)
   
}
class HTTPClientSpy: HTTPClient{
     func get(from url: URL) {
        requestURl = url
    }
    var requestURl :URL?
}
class RemoteFeedLoadertests: XCTestCase {
    func test_data_doesnot_request_fromURL(){
        let client = HTTPClientSpy()
      
        let sut = RemoteFeedLoader(client:client)
        
        XCTAssertNil(client.requestURl)
    }
    func test_load_requestedUrl(){
        let client = HTTPClientSpy()
        
        let sut = RemoteFeedLoader(client: client)
        sut.load()
        XCTAssertNotNil(client.requestURl)
        
    }
}
