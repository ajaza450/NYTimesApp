//
//  NetworkingManagerTests.swift
//  NYTimeAppTests
//
//  Created by EZAZ AHAMD on 28/09/24.
//

import XCTest
@testable import NYTimeApp

final class NetworkingManagerTests: XCTestCase {

    private var session: URLSession!
    private var url: URL!
    
    
    override func setUp() {
        url = URL(string: "https://api.nytimes.com")
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSessionProtocol.self]
         session = URLSession(configuration: configuration)
        
    }
    
    
    override func tearDown() {
        session = nil
        url = nil
    }
    
    
    func test_with_successful_response_response_is_valid() async throws {
        
        guard let path = Bundle.main.path(forResource: "Allsections", ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            XCTFail("Failed to get the static users file")
            return
        }
        
        MockURLSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)
            return (response!, data)
        }
         let endpoint = Endpoint.mostViewed(section: "all-sections", period: 7)
       
        let res = try await NetworkingManager.shared.request(session, endpoint, modelType: Json4Swift_Base.self)
        
        let staticJSON = try StaticJSONMapper.decode(file: "Allsections", type: Json4Swift_Base.self)
        
        XCTAssertEqual(res.status, staticJSON.status)
        XCTAssertEqual(res.results?.first?.title, staticJSON.results?.first?.title)
        XCTAssertEqual(res.results?.first?.abstract, staticJSON.results?.first?.abstract)
    }
    
    func test_invalid_file() async {
        do {
             _ = try StaticJSONMapper.decode(file: "", type: Json4Swift_Base.self)
        }catch  {
            if let networkError = error as? StaticJSONMapper.MappingError  {
                XCTAssertEqual(networkError, StaticJSONMapper.MappingError.failedToGetContents)
            }
              
           
        }
    }
    
    func test_invalidStatusCode() async {
        
        let invalidStatusCode = 400
       
        MockURLSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url:self.url,
                                           statusCode: invalidStatusCode,
                                           httpVersion: nil,
                                           headerFields: nil)
            return (response!, nil)
        }
        
        let endpoint = Endpoint.mostViewed(section: "all-sections", period: 7)
      
        do {
            _ = try await NetworkingManager.shared.request(session, endpoint, modelType: Json4Swift_Base.self)
              } catch  {
                  if let networkError = error as? NetworkError  {
                      XCTAssertEqual(networkError,
                                     NetworkError.invalidStatusCode(status: invalidStatusCode))
                  }
                    
                 
              }
    }
    
    
    
      
   
}
