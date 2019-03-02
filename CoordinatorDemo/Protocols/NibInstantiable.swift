//
//  FactoryProtocol.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/1/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation
import UIKit

protocol NibInstantiable {}

extension NibInstantiable where Self: UIViewController {
    static func create() -> Self {
        return Self(nibName: nil, bundle: nil)
    }
}
