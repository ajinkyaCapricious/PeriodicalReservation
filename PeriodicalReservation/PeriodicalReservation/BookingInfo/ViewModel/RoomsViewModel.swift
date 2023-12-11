//
//  RoomsViewModel.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 11/12/23.
//

import Foundation


class RoomsViewModel: ObservableObject {
    
    @Published var tableData: [String] = ["Ajinkya ", "Ram", "Shiva"]
    @Published var selectedListItem: String?
    @Published var isCollapsed: Bool = true
    
    init(tableData: [String], isCollapsed: Bool = false) {
        self.isCollapsed = isCollapsed
        self.tableData = tableData
    }
}
