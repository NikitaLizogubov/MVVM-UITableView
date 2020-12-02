//
//  MainCellFactory.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import UIKit

struct MainCellFactory: AdaptedTableViewCellFactoryProtocol {
    
    var cellTypes: [AdaptedCellProtocol.Type] = [
        TextTableViewCell.self,
        ButtonTableViewCell.self
    ]
    
    func generateCell(viewModel: AdaptedCellViewModelProtocol, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        switch viewModel {
        case let viewModel as TextCellViewModelType:
            let view = TextTableViewCell.reuse(tableView, for: indexPath)
            view.viewModel = viewModel
            return view
        case let viewModel as ButtonCellViewModelType:
            let view = ButtonTableViewCell.reuse(tableView, for: indexPath)
            view.viewModel = viewModel
            return view
        default:
            return UITableViewCell()
        }
    }
    
}
