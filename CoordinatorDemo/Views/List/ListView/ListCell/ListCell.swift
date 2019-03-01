//
//  ListCell.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/1/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation
import UIKit

final class ListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func configureForViewModel(viewModel: ListCellViewModel) {
        titleLabel.text = viewModel.title
    }

}
