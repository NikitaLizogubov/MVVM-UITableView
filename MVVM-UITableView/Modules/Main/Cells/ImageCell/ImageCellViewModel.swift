//
//  ImageCellViewModel.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import Foundation

protocol ImageCellViewModelInputProtocol {
    var imageName: String { get }
}

typealias ImageCellViewModelType = AdaptedCellViewModelProtocol & ImageCellViewModelInputProtocol

class ImageCellViewModel: ImageCellViewModelType {
    
    var imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
}
