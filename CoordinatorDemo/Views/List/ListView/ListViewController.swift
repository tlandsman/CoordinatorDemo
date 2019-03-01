//
//  ViewController.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 2/20/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController, FactoryProtocol {
    @IBOutlet weak var titleLabel: UILabel!
    var viewModel: ListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = "Hello World"
    }
}

