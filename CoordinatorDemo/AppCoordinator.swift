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

class AppCoordinator: Coordinator {
  
    var window: UIWindow
    var navController: UINavigationController
    
    init() {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstViewController = FirstViewController()
        self.navController = UINavigationController(rootViewController: firstViewController)
   
   
    }
    
    func start() {
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
}
