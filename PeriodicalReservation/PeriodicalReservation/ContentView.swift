//
//  ContentView.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var selectedDate: Date?
       @State private var isDatePickerVisible = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Start date")
                .font(.headline)
            
            DatePickerBox(title: "Select Date", selectedDate: $selectedDate, isDatePickerVisible: $isDatePickerVisible)
            
            if let selectedDate = selectedDate {
                Text("Selected Date: \(formattedDate(selectedDate))")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
    
    private func formattedDate(_ date: Date) -> String {
           let formatter = DateFormatter()
           formatter.dateStyle = .medium
           return formatter.string(from: date)
       }
}


struct DatePickerBox: View {
    var title: String
    @Binding var selectedDate: Date?
    @Binding var isDatePickerVisible: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.subheadline)
                Spacer()
                Button(action: {
                    isDatePickerVisible.toggle()
                }) {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.leading, 8)
            }
            .padding(.bottom, 4)

            RoundedRectangle(cornerRadius: 8)
                .overlay(
                    HStack {
                        if let selectedDate = selectedDate {
                            Text(formattedDate(selectedDate))
                                .foregroundColor(.primary)
                        } else {
                            Text("Select a date")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(8)
                )
                .onTapGesture {
                    isDatePickerVisible.toggle()
                }
                .border(Color.gray, width: 1)
        }
        .sheet(isPresented: $isDatePickerVisible) {
            DatePicker("Select Date", selection: Binding(
                get: { selectedDate ?? Date() },
                set: { selectedDate = $0 }
            ), in: ...Date(), displayedComponents: [.date])
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}




#Preview {
    ContentView()
}
