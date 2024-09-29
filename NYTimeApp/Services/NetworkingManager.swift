//
//  NetworkingManager.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 26/09/24.
//

import Foundation

protocol NetworkingManagerImpl {
    func request<T: Codable>(_ session: URLSession , _ endpoint: EndPointType, modelType : T.Type) async throws -> T
}

final class NetworkingManager: NetworkingManagerImpl {
    static let shared = NetworkingManager()
    private init(){}
    
    
    func request<T: Codable>(_ session: URLSession = .shared, _ endpoint: EndPointType, modelType : T.Type) async throws -> T {
        guard let url = endpoint.url else{
            throw NetworkError.invalidUrl
        }
        // trailing_closure:
        let request = buildRequest(from: url, methodType: endpoint.method)
        
        let (data, response) = try await session.data(for: request)
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else{
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkError.invalidStatusCode(status: statusCode)
        }
        let decoder =  JSONDecoder()
        let res = try decoder.decode(T.self, from: data)
        return res
        
    
    }
    
}


private extension NetworkingManager {
    
    
    func buildRequest(from url: URL,
                      methodType: HTTPMethods) -> URLRequest {
        var request = URLRequest(url: url)
        
        switch methodType {
        case .get:
            request.httpMethod = "GET"
       
        }
        return request
    }
}


