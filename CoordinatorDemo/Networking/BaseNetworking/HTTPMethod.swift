//
//  HTTPMethod.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

enum HTTPMethod {
    case get
    case post(body: DataEncodable)
    case put(body: DataEncodable)
    
    var displayType: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        }
    }
    
    var body: DataEncodable? {
        switch self {
        case .get:
            return nil
        case .post(let body):
            return body
        case .put(let body):
            return body
        }
    }
}

