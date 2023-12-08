//
//  RecurringBookingViewModel.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import Foundation


class ViewModel: ObservableObject {
    
    
    @Published var tableData: [String] = ["Ajinkya ", "Ram", "Shiva"]
    @Published var selectedListItem: String?
    @Published var isCollapsed: Bool = false
    
    
    init(tableData: [String], isCollapsed: Bool = false) {
            self.tableData = tableData
        self.isCollapsed = isCollapsed
        }
    
    // Add any other necessary logic or data here
}
