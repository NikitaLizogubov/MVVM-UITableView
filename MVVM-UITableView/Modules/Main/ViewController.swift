//
//  ViewController.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: AdaptedTableView! {
        didSet {
            tableView.setup()
        }
    }

}

