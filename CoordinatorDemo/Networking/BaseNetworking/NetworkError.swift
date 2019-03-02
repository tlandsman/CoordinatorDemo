//
//  NetworkError.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decoding
    case encoding
    case missingUrl
    case connection(description:String?, statusCode: Int?)
    case other
}
