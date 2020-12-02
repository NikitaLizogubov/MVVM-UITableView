//
//  ViewController.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: AdaptedTableView! {
        didSet {
            tableView.viewModel = MainViewModel()
            tableView.cellFactory = MainCellFactory()
            
            tableView.setup()
        }
    }
    
}

