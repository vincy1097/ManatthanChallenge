//
//  Booking.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 17/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import Foundation

class Booking {
    var startDateTime:Date
    var endingDateTime:Date
    var user:User
    var bookedItem:SharedItem
    
    init(from start: Date, to end:Date, by user:User, forItem item:SharedItem){
        startDateTime = start
        endingDateTime = end
        self.user = user
        bookedItem = item
    }
}

class Bookings{
    static let shared = Bookings()
    var bookings:[Booking]?
    
    func getBookings(forItem sharedItem:SharedItem?) -> [Booking]{
        guard let bookings = self.bookings else{
            return []
        }
        guard let item = sharedItem else{
            return bookings
        }
        
        var bookingsForItem:[Booking] = []
        for booking in bookings{
            if booking.bookedItem == item{
                bookingsForItem.append(booking)
            }
        }
        return bookingsForItem
    }
}
