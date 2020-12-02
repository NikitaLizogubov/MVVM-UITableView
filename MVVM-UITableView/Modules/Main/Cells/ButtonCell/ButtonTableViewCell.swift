//
//  ButtonTableViewCell.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import UIKit

final class ButtonTableViewCell: UITableViewCell, AdaptedCellProtocol {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var button: UIButton!
    
    // MARK: - Public properties
    
    var viewModel: ButtonCellViewModelType? {
        didSet {
            bindViewModel()
        }
    }
    
    // MARK: - Private methods
    
    private func bindViewModel() {
        button.setTitle(viewModel?.buttonTitle, for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction
    private func didSelect(_ sender: Any) {
        viewModel?.didSelect()
    }
    
}
