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
        
        XCTAssertTrue(client.requestURls.isEmpty)
    }
    func test_load_requestedDataFromUrl(){
        let url = URL(string: "jkjkh.dafds.dssd")!
        let (sut, client) = makeSut(url: url)
        sut.load()
        XCTAssertEqual(client.requestURls, [url])
        
    }
    func test_load_twice_requestedDataFromUrl(){
        let url = URL(string: "jkjkh.dafds.dssd")!
        let (sut, client) = makeSut(url: url)
        sut.load()
        sut.load()
        XCTAssertEqual(client.requestURls, [url,url])
        
    }
    func test_load_deliversErroronClientError(){
        let (suit,client) = makeSut()
        client.error = NSError(domain: "test", code: 0)
        var capureError: RemoteFeedLoader.Error?
        suit.load { error in capureError = error
            
        }
        XCTAssertEqual(capureError, .connectivity)
    }
    private func makeSut(url: URL = URL(string: "jkjkh.dafds.dssd")!) ->(sut: RemoteFeedLoader, client : HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url,  client: client)
        return (sut,client)
    }
    private class HTTPClientSpy: HTTPClient{
      
        var requestURls = [URL]()
        var error : NSError?
        func get(from url: URL,completion: @escaping(Error) -> Void) {
            if let error = error {
                completion(error)
            }
           requestURls.append(url)
       }
   }
         
}
