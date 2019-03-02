//
//  NetworkRequestProtocol.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

// NetworkRequestProtocol
//
// Interface to define the network request
protocol NetworkRequestProtocol {
    //ValueType defines the returned value model
    associatedtype ValueType
    // ErrorType defines the returned network error
    associatedtype ErrorType: Error
    typealias ResultType = Result<ValueType, ErrorType>
    
    var hostString: String { get }
    var defaultHeaders: [String: String]? { get }
    
    var pathUrlString: String { get }
    var httpMethod: HTTPMethod { get }
    var additionalHeaders: [String: String]? { get }
    var additionalQueryParams: [String: String]? { get }
    
    func handleResponse(_ data: Data) -> ResultType
    func handleError(_ error: Error?) -> ResultType
}

extension NetworkRequestProtocol {
    func handleError(_ error: Error?) -> Result<ValueType, NetworkError> {
        return Result<ValueType, NetworkError>.failure(NetworkError.connection(description: error?.localizedDescription, statusCode: error?.code))
    }
}

extension NetworkRequestProtocol where ValueType: Decodable {
    func handleResponse(_ data: Data) -> Result<ValueType, NetworkError> {
        do {
            let responseObject = try JSONDecoder().decode(ValueType.self, from: data)
            return Result<ValueType, NetworkError>.success(responseObject)
        } catch {
            return Result<ValueType, NetworkError>.failure(NetworkError.decoding)
        }
    }
}


