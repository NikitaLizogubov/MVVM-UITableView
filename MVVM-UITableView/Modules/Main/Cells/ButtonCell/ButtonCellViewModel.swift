//
//  ButtonCellViewModel.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import Foundation

protocol ButtonCellViewModelInputProtocol {
    var buttonTitle: String { get }
}

protocol ButtonCellViewModelOutputProtocol {
    func didSelect()
}

typealias ButtonCellViewModelType =
    AdaptedCellViewModelProtocol &
    ButtonCellViewModelInputProtocol &
    ButtonCellViewModelOutputProtocol

class ButtonCellViewModel: ButtonCellViewModelType {
    
    var buttonTitle: String
    
    private let selectionHandler: () -> Void
    
    init(buttonTitle: String, selectionHandler: @escaping () -> Void) {
        self.buttonTitle = buttonTitle
        self.selectionHandler = selectionHandler
    }
    
    func didSelect() {
        selectionHandler()
    }
    
}
