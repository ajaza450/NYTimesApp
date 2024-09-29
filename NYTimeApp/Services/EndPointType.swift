//
//  Endpoint.swift
//  NYTimeApp
//
//  Created by EZAZ AHAMD on 26/09/24.
//

import Foundation


enum HTTPMethods:String {
    case get = "GET"
}

protocol EndPointType {
    var baseURL: String { get }
    var path: String { get }
    var url:URL? {get}
    var method:HTTPMethods {get}
}



