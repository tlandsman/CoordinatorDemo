//
//  ListCell.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/1/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

final class ListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    static let identifier = "ListCell"
    
    func configureForViewModel(viewModel: ListCellViewModel) {
        titleLabel.text = viewModel.title
    }

}
