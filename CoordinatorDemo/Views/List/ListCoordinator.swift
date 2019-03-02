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
    
        
        
        self.navController = navController
        self.listVC = ListViewController.create()
        let onCoordinationResult: (CoordinationResult) -> Void = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .didSelectItem(let item):
                print("Selected \(item)")
                self.showDetailView()
            }
        }
        self.listVC.viewModel = ListViewModel(coordinationBlock: onCoordinationResult)
        
    }
    
    func start() {
        navController.pushViewController(listVC, animated: true)
    }
    
    private func showDetailView() {
        let viewModel = DetailViewModel()
        let detailVC = DetailViewController.create()
        detailVC.viewModel = viewModel
        navController.pushViewController(detailVC, animated: true)
    }
}
