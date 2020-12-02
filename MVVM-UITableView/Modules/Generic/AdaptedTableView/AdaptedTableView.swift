//
//  AdaptedTableView.swift
//  MVVM-UITableView
//
//  Created by Nikita Lizogubov on 02.12.2020.
//

import UIKit
import Combine

protocol AdaptedCellViewModelProtocol {
    
}

protocol AdaptedSectionViewModelProtocol {
    var cells: [AdaptedCellViewModelProtocol] { get }
    var reloadDataPublisher: AnyPublisher<Void, Never> { get }
}

protocol AdaptedViewModelInputProtocol {
    var sections: [AdaptedSectionViewModelProtocol] { get }
}

protocol AdaptedViewModelOutputProtocol {
    func didSelectRowAt(indexPath: IndexPath)
}

typealias AdaptedSectionViewModelType = AdaptedViewModelInputProtocol & AdaptedViewModelOutputProtocol

protocol AdaptedCellProtocol {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension AdaptedCellProtocol {
    
    static var identifier: String {
        String(describing: self)
    }
    
    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
}

protocol AdaptedTableViewCellFactoryProtocol {
    var cellTypes: [AdaptedCellProtocol.Type] { get }
    func generateCell(viewModel: AdaptedCellViewModelProtocol, tableView: UITableView) -> UITableViewCell
}

class AdaptedTableView: UITableView {
    
    // MARK: - Public properties
    
    var viewModel: AdaptedSectionViewModelType?
    var cellFactory: AdaptedTableViewCellFactoryProtocol?
    
    // MARK: - Private properties
    
    private var cancellables: [AnyCancellable] = []
    
    // MARK: - Public methods
    
    func setup() {
        self.dataSource = self
        self.delegate = self
        
        self.registerCells()
        self.bindSections()
    }
    
    // MARK: - Private methods
    
    private func registerCells() {
        cellFactory?.cellTypes.forEach({
            self.register($0.nib, forCellReuseIdentifier: $0.identifier)
        })
    }
    
    private func bindSections() {
        viewModel?.sections.enumerated().forEach({ (index, section) in
            section.reloadDataPublisher.sink { [weak self] in
                self?.reloadSections([index], with: .automatic)
            }.store(in: &cancellables)
        })
    }
    
}

// MARK: - UITableViewDataSource

extension AdaptedTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.sections.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.sections[section].cells.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellFactory = cellFactory,
            let cellViewModel = viewModel?.sections[indexPath.section].cells[indexPath.row]
        else {
            return UITableViewCell()
        }
        
        return cellFactory.generateCell(viewModel: cellViewModel, tableView: tableView)
    }
    
}

// MARK: - UITableViewDelegate

extension AdaptedTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectRowAt(indexPath: indexPath)
    }
    
}
