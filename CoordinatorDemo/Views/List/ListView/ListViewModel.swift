//
//  ListViewModel.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/1/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

final class ListViewModel {
    
    let coordinationBlock: (CoordinationResult) -> Void
    
    let title = "TitleTest"
    let list: [ListCellViewModel] = [ListCellViewModel(title: "blue fish"), ListCellViewModel(title: "red fish")]
    
    init(coordinationBlock: @escaping (CoordinationResult) -> Void) {
        self.coordinationBlock = coordinationBlock
    }
}
