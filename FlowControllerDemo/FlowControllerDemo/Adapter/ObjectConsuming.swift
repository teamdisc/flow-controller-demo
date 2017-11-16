//
//  ObjectConsuming.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 13/10/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

protocol ObjectConsuming {
    
    associatedtype ObjectType
    
//    func applyObject(_ object: ObjectType) -> Void
    
}

// ConsumableTableViewCell

protocol Consumable: ObjectConsuming {
    
    func applyObject(_ object: ObjectType) -> Void
    
}

protocol Configurable: class {
    
    associatedtype ItemType
    func configure(with item: ItemType)
    
}

protocol ConfiguratorType {
    
    var cellClass: UITableViewCell.Type { get }
    
    func configure(_ cell: UITableViewCell)
    func invoke(action: AdapterActionType, for cell: UITableViewCell, at indexPath: IndexPath)
    
}

struct CellConfigurator<CellType: UITableViewCell>: ConfiguratorType where CellType: Configurable {
    
    let item: CellType.ItemType
    let cellClass: UITableViewCell.Type// = CellType.self
    
    init(_ cellClass: CellType.Type, item: CellType.ItemType) {
        self.item = item
        self.cellClass = cellClass
    }
    
    func configure(_ cell: UITableViewCell) {
        if let cell = cell as? CellType {
            cell.configure(with: item)
        }
    }
    
    func invoke(action: AdapterActionType, for cell: UITableViewCell, at indexPath: IndexPath) {
        //todo:- implement?
    }
    
}
