//
//  ContentView.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDays: Set<String> = []
    
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Choose Days: ")
                    .font(.title)
                    .padding(.leading)
                Spacer()
            }
            HStack {
                ForEach(["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"], id: \.self) { day in
                    Button(action: {
                        toggleDaySelection(day)
                        print(selectedDays)
                    }) {
                        Text(day)
                            .padding()
                            .background(selectedDays.contains(day) ? Color.blue : Color.gray)
                            .foregroundColor(selectedDays.contains(day) ? Color.white : Color.black)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
    }
    
    private func toggleDaySelection(_ day: String) {
        if selectedDays.contains(day) {
            selectedDays.remove(day)
        } else {
            selectedDays.insert(day)
        }
    }
}

#Preview {
    ContentView()
}


