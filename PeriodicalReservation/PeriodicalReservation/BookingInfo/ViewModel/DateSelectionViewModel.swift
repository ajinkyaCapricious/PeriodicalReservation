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
        var currentDate = startDate
        
        while currentDate <= endDate {
            let weekday = Calendar.current.component(.weekday, from: currentDate)
            print("WEKDAY :: \(weekday)")
            let weekdayString = Calendar.current.shortWeekdaySymbols[weekday - 1].uppercased()
            print("WEKDAYString :: \(weekdayString)")
            if selectedDays.contains(weekdayString) {
                totalDays += 1
            }
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

