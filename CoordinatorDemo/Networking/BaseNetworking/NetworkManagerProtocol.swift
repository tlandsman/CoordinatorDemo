//
//  NetworkManagerProtocol.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    @discardableResult
    func request<T: NetworkRequestProtocol>(_ request: T, in session: URLSession, completion: @escaping (T.ResultType) -> Void) -> URLSessionTask?
}

extension NetworkManagerProtocol {
    func buildRequest<T: NetworkRequestProtocol>(from networkRequest: T) throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = networkRequest.hostString
        urlComponents.path = networkRequest.pathUrlString
        if let additionalQueryParams = networkRequest.additionalQueryParams {
            urlComponents.queryItems = additionalQueryParams.compactMap {
                URLQueryItem(name: $0, value: $1)
            }
        }
        guard let url = urlComponents.url else {
            assertionFailure("url is nil")
            throw NetworkError.missingUrl
        }
        var request = URLRequest(url: url)
        print("URL is \(String(describing: request.url))")
        request.httpMethod = networkRequest.httpMethod.displayType
        
        // Add Body
        if let httpBody = networkRequest.httpMethod.body {
            do {
                let encodedBody = try httpBody.encode()
                request.httpBody = encodedBody
                if let jsonString = String(data: encodedBody, encoding: .utf8) {
                    print("Post body is\(jsonString)") //Print for debugging
                }
            } catch {
                throw NetworkError.encoding
            }
        }
        
        // Add Headers
        if let serviceDefaultHeaders = networkRequest.defaultHeaders {
            var headerDictionary = serviceDefaultHeaders
            if let additionalHeaders = networkRequest.additionalHeaders {
                headerDictionary = headerDictionary.merging(additionalHeaders, uniquingKeysWith:  { (first, _) in first })
            }
            for (key, value) in headerDictionary {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}

