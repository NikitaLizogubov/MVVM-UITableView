//
//  AdaptedTableView.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import UIKit

protocol AdaptedViewModelInputProtocol {
    
}

protocol AdaptedTableViewCellFactoryProtocol {
    
}

final class AdaptedTableView: UITableView {
    
    var viewModel: AdaptedViewModelInputProtocol?
    var cellFactory: AdaptedTableViewCellFactoryProtocol?
    
    func setup() {
        self.dataSource = self
        self.delegate = self
    }
    
}

extension AdaptedTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}

extension AdaptedTableView: UITableViewDelegate {
    
}
