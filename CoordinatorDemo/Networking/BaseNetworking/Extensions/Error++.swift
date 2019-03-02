//
//  Error++.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

extension Error {
    var code: Int {
        return (self as NSError).code
    }
}
