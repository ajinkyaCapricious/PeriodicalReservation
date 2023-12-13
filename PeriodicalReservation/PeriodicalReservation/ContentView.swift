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
            // Your existing content goes here
            
            // Fixed box with icon and text
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white) // Background color of the box
                    .frame(width: 120, height: 60) // Adjust the size as needed
                    .shadow(radius: 3)
                
                HStack(spacing: 10) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    
                    Text("User Name")
                        .font(.headline)
                }
                .padding(8) // Padding for the content inside the box
            }
            .offset(x: UIScreen.main.bounds.width - 200, y: 20) // Adjust the offset position as needed
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


