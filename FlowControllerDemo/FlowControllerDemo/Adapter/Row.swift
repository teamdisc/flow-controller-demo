//
//  Row.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 14/10/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

struct Row<CellType: UITableViewCell>: ConfiguratorType where CellType: Configurable {
    
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
        
    }
    
}

///
/// MOCK DATA
///

extension Row where CellType: ImageTableViewCell {
    
    static var image: Row<ImageTableViewCell> {
        let item = ImageViewModel(text: "click")
        return Row<ImageTableViewCell>(ImageTableViewCell.self, item: item)
    }
    
}

class ImageViewModel {
    
    static var count = 0
    
    var text: String
    
    init(text: String = "image") {
        if text == "image" {
            self.text = text
            return
        }
        self.text = text + ": \(ImageViewModel.count)"
        ImageViewModel.count += 1
    }
}

class ImageTableViewCell: UITableViewCell, Configurable {
    
    func configure(with item: ImageViewModel) {
        textLabel?.text = item.text
    }
    
}

struct MediaViewModel {
    let text: String = "media"
}

class MediaTableViewCell: UITableViewCell, Configurable {
    
    func configure(with item: MediaViewModel) {
        textLabel?.text = item.text
    }
    
}
