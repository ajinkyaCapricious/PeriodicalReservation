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
    @State private var showAlert = false
    @State private var alertMessage = ""
    @StateObject var finalSummaryViewModel = FinalSummaryViewModel()

    
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
                    
                    if viewModel.selectedAttendeeItem == nil {
                        showAlert(message: "Please select an attendee.")
                        return
                    }
                    if viewModel.selectedRoomItem == nil {
                        showAlert(message: "Please select a room.")
                        return
                    }
                    if viewModel.dateViewModel.selectedDays.isEmpty {
                        showAlert(message: "Please select at least one day.")
                    return
                    }
                    isFinalSummaryActive = true
                    viewModel.moveToFinalSummary()
                }) {
                    Text("Review booking")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .frame(maxWidth: 250)
                }
                .alert(isPresented: $showAlert) {
                               Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                           }
                .padding()
                //.disabled(!viewModel.isDataFilledup)
                //.opacity(viewModel.isDataFilledup ? 1.0 : 0.5)
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
    
    
    private func showAlert(message: String) {
           alertMessage = message
           showAlert = true
       }
}

#Preview {
    RecurringBooking()
}


