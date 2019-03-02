//
//  ListCoordinator.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/1/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation
import UIKit


enum CoordinationResult {
    case didSelectItem(item: String)
}

final class ListCoordinator: CoordinatorProtocol {
    private let navController: UINavigationController
    private let listVC: ListViewController
    
    init(navController: UINavigationController) {
        let onCoordinationResult: (CoordinationResult) -> Void = { result in
            switch result {
            case .didSelectItem(let item):
                print("Selected \(item)")
            }
        }
        
        
        self.navController = navController
        self.listVC = ListViewController.create()
        self.listVC.viewModel = ListViewModel(coordinationBlock: onCoordinationResult)
        
    }
    
    func start() {
        navController.pushViewController(listVC, animated: true)
    }
}
