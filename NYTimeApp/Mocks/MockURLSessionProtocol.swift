//
//  MockURLSessionProtocol.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 28/09/24.
//

#if DEBUG
import Foundation

class MockURLSessionProtocol: URLProtocol {
    
    // A closure that will return a mocked response and optional data
    static var loadingHandler: (() -> (HTTPURLResponse, Data?))?
    
    // This method is used to check if the protocol can handle the request
    override class func canInit(with request: URLRequest) -> Bool {
        return true // Accept all requests
    }
    
    // Returns the canonical version of the request
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    // This method is called when the loading of the request starts
    override func startLoading() {
        guard let handler = MockURLSessionProtocol.loadingHandler else {
            fatalError("Loading handler is not set.")
        }
        
        // Use the handler to get the mock response and data
        let (response, data) = handler()
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        if let data = data {
            client?.urlProtocol(self, didLoad: data)
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    
    // This method is called when the loading is stopped (if needed)
    override func stopLoading() {
        // Not necessary for mocking purposes
    }
}
#endif
