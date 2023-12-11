//
//  Room.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 11/12/23.
//

import Foundation


struct RoomsResponse: Decodable {
    let data: RoomsData
    let id: String
    let displayName: String
    let version: Int
}

struct RoomsData: Decodable {
    let bookingRooms: [Room]
}

struct Room: Codable {
    
    let fee: String
    let endTime: String
    let feeFkey: String
    let roomFkey: String
    let roomName: String
    let startTime: String
}
