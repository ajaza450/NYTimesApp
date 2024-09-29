//
//  NetworkError.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 26/09/24.
//

import Foundation





enum NetworkError: Error,LocalizedError, Equatable {
    case invalidUrl
    case invalidStatusCode(status: Int)
    case invalidData
    case failedToDecode
    case custom(error: String)
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The URL is invalid."
        case .invalidStatusCode(let status):
            if status == 401 {
                return "The server returned an invalid status code \(status). Api key missing."
            }else{
                return "The server returned an invalid status code \(status)."
            }
        case .invalidData:
            return "The response data is invalid."
        case .failedToDecode:
            return "Failed to decode the data."
        case .custom(let error):
            return "Something went wrong: \(error)"
        }
    }
    
}
