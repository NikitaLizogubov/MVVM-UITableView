//
//  TextTableViewCell.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import UIKit

final class TextTableViewCell: UITableViewCell, AdaptedCellProtocol {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - Public properties
    
    var viewModel: TextCellViewModelInputProtocol? {
        didSet {
            bindViewModel()
        }
    }
    
    // MARK: - Private methods
    
    private func bindViewModel() {
        label.text = viewModel?.text
    }
    
}
