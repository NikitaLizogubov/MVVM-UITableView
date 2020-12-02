//
//  ImageTableViewCell.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import UIKit

final class ImageTableViewCell: UITableViewCell, AdaptedCellProtocol {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var pictureView: UIImageView!
    
    // MARK: - Public properties
    
    var viewModel: ImageCellViewModelType? {
        didSet {
            bindViewModel()
        }
    }
    
    // MARK: - Private methods
    
    private func bindViewModel() {
        guard let imageName = viewModel?.imageName else { return }
        
        pictureView.image = UIImage(named: imageName)
    }
    
}
