//
//  AppCoordinator.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 2/20/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation
import UIKit

// Primary Application Coordinator

final class AppCoordinator: CoordinatorProtocol {
  
    private let window: UIWindow
    private let rootNavController: UINavigationController
    private let listCoordinator: ListCoordinator
    
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.rootNavController = UINavigationController()
        self.listCoordinator = ListCoordinator(navController: self.rootNavController)
    }
    
    func start() {
        window.rootViewController = rootNavController
        listCoordinator.start()
        window.makeKeyAndVisible()
    }
}
