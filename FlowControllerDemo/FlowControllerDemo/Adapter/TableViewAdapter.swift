//
//  TableViewAdapter.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 13/10/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa
import Result

typealias CellWithIndexPath = (UITableViewCell, IndexPath)
typealias ItemWithCellAndIndexPath = (ConfiguratorType, UITableViewCell, IndexPath)

class TableViewAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private weak var tableView: UITableView!
    
    var configuratorsList: MutableProperty<[ConfiguratorType]>
    private var itemTypesForCellType: [String: UITableViewCell.Type] = [:]
    
    var list: [ConfiguratorType] { return configuratorsList.value }
    
    private let actionObserver = Signal<AdapterActionType, NoError>.Observer()
    
    private let actionPipe = Signal<AdapterActionType, NoError>.pipe()
    private let dataPipe = Signal<ItemWithCellAndIndexPath, NoError>.pipe()
    
    private(set) lazy var didSelectCell: Signal<ItemWithCellAndIndexPath, NoError> = {
        return actionPipe.output
            .filter { $0 == .select }
            .sample(with: dataPipe.output)
            .map { $1 }
    }()
    
    private(set) lazy var willDisplayCell: Signal<ItemWithCellAndIndexPath, NoError> = {
        return actionPipe.output
            .filter { $0 == .willDisplay }
            .sample(with: dataPipe.output)
            .map { $1 }
    }()
    
    init(on tableView: UITableView, configuratorsList: MutableProperty<[ConfiguratorType]>) {
        self.tableView = tableView
        self.configuratorsList = configuratorsList
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        self.setup()
    }
    
    //MARK:- UITableViewDatasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(configurator.cellClass, for: indexPath)
        configurator.configure(cell)
        return cell
    }
    
    func register<T: UITableViewCell>(_ cellType: T.Type) where T: Configurable {
        tableView.registerReusableCell(cellType)
        //todo:- remove lines below
        let itemType = cellType.ItemType.self
        let identifier = String(describing: type(of: itemType))
        itemTypesForCellType[identifier] = cellType
        //todo:- handle a case for view model for multiple cell classes
    }
    
    //MARK:- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        actionPipe.input.send(value: .select)
        dataPipe.input.send(value: (list[indexPath.row], cell, indexPath))
        print("### did select")
//        invoke(action: .select, for: cell, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        actionPipe.input.send(value: .willDisplay)
        dataPipe.input.send(value: (list[indexPath.row], cell, indexPath))
    }
    
    //MARK:- Private helpers
    
    private func setup() {
        configuratorsList.producer //todo: take(until:)
            .startWithValues { [weak self] list in
                self?.tableView.reloadData()
        }
    }
    
    @discardableResult
    func invoke(action: AdapterActionType, for cell: UITableViewCell, at indexPath: IndexPath) -> Any? {
        return list[indexPath.row].invoke(action: action, for: cell, at: indexPath)
    }
    
}


