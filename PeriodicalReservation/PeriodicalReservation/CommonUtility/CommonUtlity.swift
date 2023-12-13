//
//  CommonUtlity.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 11/12/23.
//

import Foundation
import SwiftUI
import Swift

class CommonUtlity {
    
    static var shared = CommonUtlity()
    
    func formattedDate(_ date: Date?) -> String {
        guard let date = date else {
            return "Not Selected"
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    func convertToCurrentTimeZone(startTime: String, endTime: String) -> (Date?, Date?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ssZ"
        
        
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        
        guard let startDate = dateFormatter.date(from: startTime),
              let endDate = dateFormatter.date(from: endTime) else {
            return (nil, nil)
        }
        
        
        let currentTimeZone = TimeZone.current
        dateFormatter.timeZone = currentTimeZone
        
        let convertedStartDateString = dateFormatter.string(from: startDate)
        let convertedEndDateString = dateFormatter.string(from: endDate)
        
        
        let convertedStartDate = dateFormatter.date(from: convertedStartDateString)
        let convertedEndDate = dateFormatter.date(from: convertedEndDateString)
        
        return (convertedStartDate, convertedEndDate)
    }
    
    func convertToAmPm(timeString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = dateFormatter.date(from: timeString) else {
            return nil
        }
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "ha"
        let formattedTime = dateFormatter.string(from: date)
        return formattedTime
    }
    
}




//let startTime = "09:00:00Z"
//let endTime = "15:00:00Z"
//
//let (convertedStartDate, convertedEndDate) = convertToCurrentTimeZone(startTime: startTime, endTime: endTime)
//
//print("Converted Start Date:", convertedStartDate ?? "Invalid date")
//print("Converted End Date:", convertedEndDate ?? "Invalid date")
