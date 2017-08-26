//
//  RoomSelectionViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class RoomSelectionViewController: UIViewController {
    
    @IBOutlet weak var doubleRoomButton: UIButton!
    @IBOutlet weak var twinRoomButton: UIButton!
    @IBOutlet weak var deluxeRoomButton: UIButton!
    
    var onSelectRoom: ((Room)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Room selection"
        self.navigationItem.backBarButtonItem = .defaultBack
    }
    
    @IBAction func roomDidTap(_ sender: UIButton) {
        guard let roomName = sender.titleLabel?.text,
            let room = Room(rawValue: roomName) else { return }
        onSelectRoom?(room)
    }
    
}
