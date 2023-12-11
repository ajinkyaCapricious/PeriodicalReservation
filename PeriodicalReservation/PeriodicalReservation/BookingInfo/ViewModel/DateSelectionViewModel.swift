//
//  DateSelectionViewModel.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 10/12/23.
//

import Foundation
import SwiftUI

class DateSelectionViewModel: ObservableObject {
    @Published var startDate: Date
    @Published var endDate: Date
    @Published var isStartDatePickerVisible = false
    @Published var isEndDatePickerVisible = false
    @Published var selectedDays: Set<String> = []
    
    
    init(startDate: Date, endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
    }
    
    func calculateTotalDays() -> Int {
        var totalDays = 0
        
        // Iterate through each day between the start and end dates
        var currentDate = startDate
        while currentDate <= endDate {
            // Check if the current day is one of the selected days
            let weekday = Calendar.current.component(.weekday, from: currentDate)
            let weekdayString = Calendar.current.shortWeekdaySymbols[weekday - 1].uppercased()
            
            if selectedDays.contains(weekdayString) {
                totalDays += 1
            }
            
            // Move to the next day
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
        }
        
        return totalDays
    }
    
    func toggleDaySelection(_ day: String) {
        if selectedDays.contains(day) {
            selectedDays.remove(day)
        } else {
            selectedDays.insert(day)
        }
    }
    
}




