//
//  RemoteFeedLoadertests.swift
//  EssentialFeedTests
//
//  Created by poonam on 04/02/25.
//

import Foundation
import XCTest
class RemoteFeedLoader {
    func load(){
        HTTPClient.shared.get(from: URL(string: "jkjkh.dafds.dssd")!)
    }
}
class HTTPClient{
    static var shared = HTTPClient()
   
    func get(from url: URL) {
 
    }
   
}
class HTTPClientSpy: HTTPClient{
    override func get(from url: URL) {
        requestURl = url
    }
    var requestURl :URL?
}
class RemoteFeedLoadertests: XCTestCase {
    func test_data_doesnot_request_fromURL(){
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        XCTAssertNil(client.requestURl)
    }
    func test_load_requestedUrl(){
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        sut.load()
        XCTAssertNotNil(client.requestURl)
        
    }
}
