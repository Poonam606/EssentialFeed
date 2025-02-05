//
//  RemoteFeedLoadertests.swift
//  EssentialFeedTests
//
//  Created by poonam on 04/02/25.
//

import Foundation
import XCTest
@testable import EssentialFeed

class RemoteFeedLoadertests: XCTestCase {
    func test_data_doesnot_request_fromURL(){
        let url = URL(string: "jkjkh.dafds.dssd")!
       let (_, client) = makeSut(url: url)
        
        XCTAssertNil(client.requestURl)
    }
    func test_load_requestedUrl(){
        let url = URL(string: "jkjkh.dafds.dssd")!
        let (sut, client) = makeSut(url: url)
        sut.load()
        XCTAssertEqual(client.requestURl, url)
        
    }
    private func makeSut(url: URL = URL(string: "jkjkh.dafds.dssd")!) ->(sut: RemoteFeedLoader, client : HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url,  client: client)
        return (sut,client)
    }
    private class HTTPClientSpy: HTTPClient{
       var requestURl :URL?
        func get(from url: URL) {
           requestURl = url
       }
   }
         
}
