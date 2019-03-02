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
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    static let identifier = "ListCell"
    
    func configureForViewModel(viewModel: ListCellViewModel) {
        titleLabel.text = viewModel.title
        
        if let testImageUrl = URL(string: "https://thumbs-prod.si-cdn.com/c3phl1TZgQ92bLQugItmtovLZhs=/fit-in/1600x0/https://public-media.si-cdn.com/filer/54/10/5410da58-2295-4e3a-a847-fecd41cdcdd9/scarlet_tanager.jpg") {
            photoImageView.kf.setImage(with: testImageUrl)
        }
    }

}
