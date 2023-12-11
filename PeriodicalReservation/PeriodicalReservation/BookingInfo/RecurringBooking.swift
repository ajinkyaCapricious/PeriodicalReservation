//
//  RecurringBooking.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import SwiftUI

struct RecurringBooking: View {
    
    @StateObject private var attendeeVM = AttendeesViewModel()
    @StateObject private var viewModel2 = RoomsViewModel(tableData: ["Day Care", "Before School", "After School"], isCollapsed: true)
    @ObservedObject private var dateViewModel = DateSelectionViewModel(startDate: Date(), endDate: Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date())
    
    var body: some View {
        NavigationView {
            ScrollView {
                //Opt
                VStack {
                    //Headding
                    Text("New Recurring Booking")
                        .font(.system(size: 23))
                        .bold()
                    ListWithRadioButtons(viewModel: attendeeVM, title: "Who's going?")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding()
                        .onAppear {
                            attendeeVM.fetchAttendees()
                        }
                    
                    ListWithRadioButtons(viewModel: attendeeVM, title: "choose a room")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding()
                }
                .onAppear {
                    attendeeVM.fetchAttendees()
                }
                //Date
                HStack(spacing: 20) {
                    
                    DateSelectionView(
                        title: "Start Date",
                        selectedDate: $dateViewModel.startDate,
                        isDatePickerVisible: $dateViewModel.isStartDatePickerVisible, isStartDate: false
                    )
                    
                    DateSelectionView(
                        title: "End Date",
                        selectedDate: $dateViewModel.endDate,
                        isDatePickerVisible: $dateViewModel.isEndDatePickerVisible, isStartDate: true
                    )
                }
                .padding()
                //days
                VStack {
                    ChooseDaysView(dateViewModel: dateViewModel)
                }
            }
        }
        .navigationTitle("First View")
    }
    
}

#Preview {
    RecurringBooking()
}

