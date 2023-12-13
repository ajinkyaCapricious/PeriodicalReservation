//
//  ChooseDaysView.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 11/12/23.
//

import Foundation
import SwiftUI

struct ChooseDaysView: View {
    @ObservedObject var dateViewModel: DateSelectionViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Choose Days: \(dateViewModel.calculateTotalDays())")
                    .font(.title)
                    .padding(.leading)
                Spacer()
            }
            HStack {
                ForEach(["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"], id: \.self) { day in
                    Button(action: {
                        dateViewModel.toggleDaySelection(day)
                        
                    }) {
                        Text(day)
                            .padding()
                            .background(dateViewModel.selectedDays.contains(day) ? Color.blue : Color.gray)
                            .foregroundColor(dateViewModel.selectedDays.contains(day) ? Color.white : Color.black)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
    }
}
