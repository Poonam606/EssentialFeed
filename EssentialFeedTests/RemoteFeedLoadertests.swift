//
//  RemoteFeedLoadertests.swift
//  EssentialFeedTests
//
//  Created by poonam on 04/02/25.
//

import Foundation
import XCTest
class RemoteFeedLoader {
    
}
class HTTPClient{
    var requestURl :URL?
}
class RemoteFeedLoadertests: XCTestCase {
    func test_data_doesnot_request_fromURL(){
        let client = HTTPClient()
        let sut = RemoteFeedLoader()
        
        XCTAssertNil(client.requestURl)
    }
}
