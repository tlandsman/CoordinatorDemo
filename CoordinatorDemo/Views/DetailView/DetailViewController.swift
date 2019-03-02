//
//  DetailViewController.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/1/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, FactoryProtocol {
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    func configureForViewModel() {
        self.title = viewModel.title
    }

}
