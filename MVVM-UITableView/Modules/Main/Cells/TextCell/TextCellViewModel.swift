//
//  TextCellViewModel.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import Foundation

protocol TextCellViewModelInputProtocol {
    var text: String { get }
}

typealias TextCellViewModelType = AdaptedCellViewModelProtocol & TextCellViewModelInputProtocol

class TextCellViewModel: TextCellViewModelType {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
}
