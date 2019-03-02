//
//  NetworkManager.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

final class NetworkManager: NetworkManagerProtocol {
    
    private var tasks: [URLSessionDataTask] = []
    
    @discardableResult
    func request<N>(_ request: N, in session: URLSession = URLSession.shared, completion: @escaping (Result<N.ValueType, N.ErrorType>) -> Void) -> URLSessionTask? where N: NetworkRequestProtocol {
        var task: URLSessionDataTask?
        do {
            let builtRequest = try self.buildRequest(from: request)
            let sessionTask = session.dataTask(with: builtRequest) { [weak self, weak task] (data, response, error) in
                //Print response for debugging
                if let data = data, let jsonAsString = String(data: data, encoding: String.Encoding.utf8) {
                    print("json string \(jsonAsString)")
                }
                
                guard let self = self else { return }
                defer {
                    if let stask = task,
                        let index = self.tasks.index(of: stask) {
                        objc_sync_enter(self)
                        self.tasks.remove(at: index)
                        objc_sync_exit(self)
                    }
                }
                
                /// If error exists handle error
                if let error = error {
                    completion(request.handleError(error))
                } else {
                    /// Handle success defined as having data, no error, and status code between 200 and 300
                    if let data = data, error == nil, let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) {
                        completion(request.handleResponse(data))
                    } else {
                        ///Handle response with error status code.
                        if let httpResponse = response as? HTTPURLResponse {
                            /// Create error with status code
                            let statusError = NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)
                            completion(request.handleError(statusError))
                        } else {
                            completion(request.handleError(nil))
                        }
                    }
                }
            }
            
            task = sessionTask
            objc_sync_enter(self)
            tasks.append(sessionTask)
            objc_sync_exit(self)
            task?.resume()
        } catch let error {
            completion(request.handleError(error))
        }
        return task
    }
    
    deinit {
        tasks.forEach { $0.cancel() }
        tasks.removeAll()
    }
}
