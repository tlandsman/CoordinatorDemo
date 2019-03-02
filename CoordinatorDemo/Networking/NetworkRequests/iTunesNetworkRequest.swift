//
//  iTunesNetworkRequest.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation


/// Network Request
///
/// Generic Value Parameter represents the expected decodable type returned by the network request

enum iTunesNetworkRequest<Value: Decodable>: NetworkRequestProtocol {
    typealias ValueType = Value
    typealias ErrorType = NetworkError
    
    case list(term: String)
    case details
    
    
    var hostString: String {
        return "itunes.apple.com"
    }
    
    var defaultHeaders: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var pathUrlString: String {
        switch self {
        case .list:
            return "/search"
        case .details:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var additionalHeaders: [String : String]? {
        return nil
    }
    
    var additionalQueryParams: [String : String]? {
        switch self {
        case .list( let term ): return ["term" : term]
        default: return nil
        }
    }
}
