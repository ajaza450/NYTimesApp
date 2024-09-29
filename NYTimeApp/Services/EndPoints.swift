//
//  Enpoints.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 26/09/24.
//

import Foundation

enum Endpoint {
    case mostViewed(section: String, period: Int)
    
}


extension Endpoint: EndPointType {
    var baseURL: String {
        return getInfoPlistValue("App_BASE_URL") ?? ""
        
    }
    
    var path: String {
        switch self {
        case .mostViewed(let section, let period):
            return "/mostpopular/v2/mostviewed/\(section)/\(period).json"
            
        }
        
    }
    
    
    
    var method: HTTPMethods {
        switch self {
            
        case .mostViewed:
            return .get
        }
    }
    
    
    
    var url: URL? {
        var urlComponents = URLComponents(string: baseURL + path)
        var requestQueryItems = [URLQueryItem]()
        let api_Key = getInfoPlistValue("App_API_KEY") ?? ""
        requestQueryItems = [
            URLQueryItem(name: "api-key", value: api_Key)
        ]
        urlComponents?.queryItems = requestQueryItems
        return urlComponents?.url
    }
    
    
    
    func getInfoPlistValue(_ key: String ) -> String? {
        return Bundle.main.object(forInfoDictionaryKey: key) as? String
    }
    
}
