//
//  MockNetworkingManager.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 27/09/24.
//

import Foundation


enum MockResultState {
    case success
    case error(NetworkError)
    case nilResults
    case customError(Error)
}




class MockNetworkingManager: NetworkingManagerImpl {
    var mockArticles: [Article] = []
    var resultState: MockResultState = .success

    
    func request<T: Codable>(_ session: URLSession, _ endpoint: any EndPointType, modelType: T.Type) async throws -> T {
        
        switch resultState {
        case .success:
            let mockResponse = Json4Swift_Base(status: "200", results: mockArticles) // Create mock response
            return mockResponse as! T
        case .error(let networkError):
            throw networkError
        case .nilResults:
            let mockResponse = Json4Swift_Base(status: "200", results: nil) // Create mock response
            return mockResponse as! T
        case .customError(let error):
            throw error
        }
        
        
    }
    
    
    
}
