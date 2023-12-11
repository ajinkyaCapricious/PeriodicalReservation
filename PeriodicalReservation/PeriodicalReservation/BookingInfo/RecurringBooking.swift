//
//  RecurringBooking.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import SwiftUI

struct RecurringBooking: View {
    @StateObject private var viewModel = AttendeesViewModel()

    @StateObject private var viewModel2 = RoomsViewModel(tableData: ["Day Care", "Before School", "After School"], isCollapsed: true)
    @ObservedObject private var dateViewModel = DateSelectionViewModel(startDate: Date(), endDate: Date())
    
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
                        .onAppear {
                                   viewModel.fetchAttendees()
                               }
                    
                    ListWithRadioButtons(viewModel: viewModel, title: "choose a room")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding()
                    
                }
                .onAppear {
                           viewModel.fetchAttendees()
                       }
                //Date
                HStack(spacing: 20) {
                    DateSelectionView(
                        title: "Start Date",
                        selectedDate: $dateViewModel.startDate,
                        isDatePickerVisible: $dateViewModel.isStartDatePickerVisible
                    )
                    
                    DateSelectionView(
                        title: "End Date",
                        selectedDate: $dateViewModel.endDate,
                        isDatePickerVisible: $dateViewModel.isEndDatePickerVisible
                    )
                }
                .padding()
                //days
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
        .navigationTitle("First View")
    }
        
}

#Preview {
    RecurringBooking()
}

