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
    
}
