//
//  Result.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

enum Result<DataCodable, NetworkError> {
    case success(DataCodable)
    case failure(NetworkError)
}
