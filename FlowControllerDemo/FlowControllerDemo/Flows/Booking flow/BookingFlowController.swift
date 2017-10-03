//
//  BookingFlowController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class BookingFlowController: FlowController {
    
    let flowMode: FlowMode
    private(set) var reservation: Reservation
    
    var onCompleteBooking: (()->Void)? //todo:- booking
    var onDismiss: (()->Void)?
    
    enum FlowMode {
        case booking(with: Hotel)
        case promotion(with: Hotel)
    }
    
    init(on navigationController: UINavigationController, for flow: FlowMode) {
        flowMode = flow
        switch flow {
        case .booking(let hotel), .promotion(let hotel):
            reservation = Reservation(hotel: hotel)
            if case .promotion = flow { reservation.promotion = hotel.promotion }
        }
        super.init(on: navigationController)
    }
    
    override func start() {
        showDatePicker()
    }
    
    //MARK:- Controller showing handler
    
    func showDatePicker() {
        let controller: DatePickerViewController = DatePickerViewController.loadFromNib()
        controller.onSelectNightAmount = {
            self.reservation.nightAmount = $0
            self.showRoomSelection()
        }
        router.push(controller)
    }
    
    func showRoomSelection() {
        let controller: RoomSelectionViewController = RoomSelectionViewController.loadFromNib()
        controller.onSelectRoom = {
            self.reservation.room = $0
            self.showPriceSelection()
        }
        router.push(controller)
    }
    
    func showPriceSelection() {
        let controller: PriceSelectionViewController = PriceSelectionViewController.loadFromNib()
        controller.nightAmount = reservation.nightAmount
        controller.room = reservation.room
        controller.onSelectIsMember = {
            self.reservation.isMember = $0
            self.showGuestDetail()
        }
        router.push(controller)
    }
    
    func showGuestDetail() {
        let controller: GuestDetailViewController = GuestDetailViewController.loadFromNib()
        controller.guest = reservation.guest
        controller.onDidDisappear = { self.reservation.guest = $0 } // to retain guest details
        controller.onCompleteGuestDetail = {
            self.reservation.guest = $0
            self.showBookingReview()
        }
        router.push(controller)
    }
    
    func showBookingReview() {
        let controller: BookingReviewViewController = BookingReviewViewController.loadFromNib()
        controller.reservation = reservation
        controller.onCompleteBooking = {
            print("### complete: booking flow")
            self.onCompleteBooking?()
        }
        router.push(controller)
    }

}
