//
//  ListCoordinator.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/1/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation
import UIKit

final class ListCoordinator: CoordinatorProtocol {
    private let navController: UINavigationController
    private let listVC: ListViewController
    
    init(navController: UINavigationController) {
        self.navController = navController
        self.listVC = ListViewController.create()
        self.listVC.viewModel = ListViewModel()
        
    }
    
    func start() {
        navController.pushViewController(listVC, animated: true)
    }
}
