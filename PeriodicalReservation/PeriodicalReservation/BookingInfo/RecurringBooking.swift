//
//  RecurringBooking.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import SwiftUI

struct RecurringBooking: View {
    
    @StateObject private var viewModel = RecurringBookingViewModel()
    @State private var isFinalSummaryActive = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                //Opt
                VStack {
                    //Headding
                    Text("New Recurring Booking")
                        .font(.system(size: 23))
                        .bold()
                    AttendeeListWithRadioButtons(viewModel: viewModel, title: "Who's going?")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding()
                        .onAppear {
                            viewModel.fetchAttendees()
                        }
                    
                    RoomListWithRadioButtons(viewModel: viewModel, title: "choose a room")
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding()
                }
                
                //Date
                HStack(spacing: 20) {
                    DateSelectionView(
                        title: "Start Date",
                        selectedDate: $viewModel.dateViewModel.startDate,
                        isDatePickerVisible: $viewModel.dateViewModel.isStartDatePickerVisible, isStartDate: false
                    )
                    
                    DateSelectionView(
                        title: "End Date",
                        selectedDate: $viewModel.dateViewModel.endDate,
                        isDatePickerVisible: $viewModel.dateViewModel.isEndDatePickerVisible, isStartDate: true
                    )
                }
                .padding()
                //days
                VStack {
                    ChooseDaysView(dateViewModel: viewModel.dateViewModel)
                }
                
                Button(action: {
                    viewModel.moveToFinalSummary()
                    isFinalSummaryActive = true
                }) {
                    Text("Continue to Final Summary")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                //GotoNew Screen
                NavigationLink(
                    destination: FinalSummary(finalSummaryViewModel: viewModel.finalSummaryViewModel),
                    isActive: $isFinalSummaryActive
                ) {
                    EmptyView()
                }
                .hidden()
                
            }
        }
        .navigationTitle("First View")
    }
}

#Preview {
    RecurringBooking()
}
