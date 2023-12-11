//
//  Attendee.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 11/12/23.
//

import Foundation

struct ChildrenResponse: Decodable {
    let data: ChildrenData
}

struct ChildrenData: Decodable {
    let children: [Attendee]
}

struct Attendee: Codable, Equatable {
    let age: Int
    let fkey: String
    let fullName: String
    let availableRoomsId: String
    
    
    static func == (lhs: Attendee, rhs: Attendee) -> Bool {
        return lhs.fkey == rhs.fkey
    }
}
