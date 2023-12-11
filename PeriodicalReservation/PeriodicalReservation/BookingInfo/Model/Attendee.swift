//
//  Attendee.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 11/12/23.
//

import Foundation
struct Attendee: Codable, Identifiable {
    var id = UUID()
    let age: Int
    let fkey: String
    let fullName: String
    let availableRoomsId: String
}
