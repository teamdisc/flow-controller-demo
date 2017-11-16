//
//  HotelSearchViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit
import ReactiveSwift

class HotelSearchViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickCountryButton: UIButton!
    
    private var tableViewAdapter: TableViewAdapter!
    private var rows = MutableProperty<[ConfiguratorType]>([])
    
    var onSelectPickCountry: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hotel search"
        rows.value = [
            Row(ImageTableViewCell.self, item: ImageViewModel()),
            Row(ImageTableViewCell.self, item: ImageViewModel()),
            Row(MediaTableViewCell.self, item: MediaViewModel()),
            Row(MediaTableViewCell.self, item: MediaViewModel())
        ]
        
        tableViewAdapter = TableViewAdapter(on: tableView, configuratorsList: rows)
        tableViewAdapter.register(ImageTableViewCell.self)
        tableViewAdapter.register(MediaTableViewCell.self)
        tableViewAdapter.didSelectCell
            .observeValues { (row, cell, indexPath) in
                guard let item = (row as? Row<ImageTableViewCell>)?.item else { return }
                item.text = "clicked!"
        }
    }

    @IBAction func pickCountryDidTap(_ sender: Any) {
        rows.value.insert(Row.image, at: 1)
//        onSelectPickCountry?()
    }
    
}
