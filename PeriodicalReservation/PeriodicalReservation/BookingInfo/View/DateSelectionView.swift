//
//  DateSelectionView.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 10/12/23.
//

import Foundation
import SwiftUI

struct DateSelectionView: View {
    var title: String
    @Binding var selectedDate: Date
    @Binding var isDatePickerVisible: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.blue)
                    .frame(width: 20, height: 20)
                Text(title)
                    .font(.headline)
            }
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.blue)
                    .frame(width: 20, height: 20)
                Text(CommonUtlity.shared.formattedDate(selectedDate))
                    .font(.headline)
                    .onTapGesture {
                        isDatePickerVisible.toggle()
                    }
                    .popover(isPresented: $isDatePickerVisible) {
                        DatePicker("Select Date", selection: $selectedDate, in: ...Date(), displayedComponents: [.date])
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                            .frame(width: 300)
                            .onDisappear {
                                isDatePickerVisible = false
                            }
                    }
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 2)
        )
    }
    
    
    
    
}
