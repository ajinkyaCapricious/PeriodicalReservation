//
//  FinalSummaryViewModel.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 12/12/23.
//

import Foundation

class FinalSummaryViewModel: ObservableObject {
    
    @Published var attendee: Attendee?
    @Published var room: Room?
    @Published var startDate: Date?
    @Published var endDate: Date?
    @Published var numberOfDays: Int?
    @Published var selectedDays: Set<String>?
    func setBookingData( startDate: Date, endDate: Date, numberOfDays: Int, selectedDays: Set<String>) {
//    func setBookingData(attendee: Attendee, room: Room, startDate: Date, endDate: Date, numberOfDays: Int, selectedDays: Set<String>) {
//        self.attendee = attendee
//        self.room = room
        self.startDate = startDate
        self.endDate = endDate
        self.numberOfDays = numberOfDays
        self.selectedDays = selectedDays
    }
}
