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
    var didFetch: Observable<Bool> = Observable<Bool>(value: false)
    
    private let networkManager = NetworkManager()
    
    init(coordinationBlock: @escaping (CoordinationResult) -> Void) {
        self.coordinationBlock = coordinationBlock
        fetchList()
    }
    
    private func fetchList() {
        let listRequest = iTunesNetworkRequest<AlbumList>.list(term: "jack+johnson")
        networkManager.request(listRequest) { [weak self ] (result) in
            
            self?.didFetch.value = true
            switch result {
            case .success(let list):
                print("Success")
                dump(list)
            case .failure:
                //TODO: Handle failure
                print("Failed to fetch list")
            }
        }
    }
}
