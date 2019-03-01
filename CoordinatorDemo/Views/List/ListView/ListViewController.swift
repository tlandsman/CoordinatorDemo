//
//  ViewController.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 2/20/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController, FactoryProtocol {

    var viewModel: ListViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureForViewModel()
        let cellNib = UINib(nibName: "ListCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "ListCell")
    }
    
    func configureForViewModel() {
      
    }
}



extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        let cellViewModel = viewModel.list[indexPath.row]
        cell.configureForViewModel(viewModel: cellViewModel)
        return cell
    }
 
}

extension ListViewController: UITableViewDelegate {
    
}
