//
//  RecurringBooking.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import SwiftUI

struct RecurringBooking: View {
    
    @StateObject private var viewModel = ViewModel(tableData: ["Ajinkya ", "Ram", "Shiva"])
    @StateObject private var viewModel2 = ViewModel(tableData: ["Day Care", "Before School", "After School"], isCollapsed: true)
    
    var body: some View {
        NavigationView {
            ScrollView {
                //Opt
                VStack {
                    //Headding
                    Text("New Recurring Booking")
                        .font(.system(size: 23))
                        .bold()
                    
                    ListWithRadioButtons(viewModel: viewModel, title: "Who's going?")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding()
                    
                    ListWithRadioButtons(viewModel: viewModel2, title: "choose a room")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding()
                    
                }
                //Date
                
                HStack {
                    VStack {
                        Text("Ajinkya")
                        Text("Ajinkya")
                        
                    }
                    .padding()
                    VStack {
                        Text("Ajinkya")
                        
                        
                    }
                    .padding()
                    
                    
                }
                .padding()
            }
        }
        .navigationTitle("First View")
    }
}

#Preview {
    RecurringBooking()
}

