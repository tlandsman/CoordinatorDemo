//
//  DataCodable.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

typealias DataCodable = DataDecodable & DataEncodable

/// DataDecodable
///
/// Interface for decoding data structures into qualified objects.
protocol DataDecodable {
    static func decode(from data: Data) throws -> Self
}

extension DataEncodable where Self: Decodable {
    static func decode(from data: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: data)
    }
}

extension String: DataDecodable {
    static func decode(from data: Data) throws -> String {
        return String(decoding: data, as: UTF8.self)
    }
}

extension Data: DataDecodable {
    static func decode(from data: Data) throws -> Data {
        return data
    }
}

/// DataEncodable
///
/// Interface for encoding structures into raw data.
protocol DataEncodable {
    func encode() throws -> Data
}

extension DataEncodable where Self: Encodable {
    func encode() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}

extension String: DataEncodable {
    func encode() throws -> Data {
        let data = self.data(using: .utf8)
        if let data = data {
            return data
        } else {
            throw NetworkError.encoding
        }
    }
}

extension Dictionary: DataEncodable {
    func encode() throws -> Data {
        return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}
