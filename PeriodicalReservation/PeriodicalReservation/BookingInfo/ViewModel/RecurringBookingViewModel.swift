//
//  RecurringBookingViewModel.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import Foundation

class RecurringBookingViewModel: ObservableObject {
    
    @Published var arrAttendees: [Attendee] = []
    @Published var arrRoom: [Room] = []
    @Published var selectedAttendeeItem: Attendee?
    @Published var selectedRoomItem: Room?
    
    @Published var isCollapsed: Bool = false
    @Published var isRoomCollapsed: Bool = true
    @Published var finalSummaryViewModel = FinalSummaryViewModel()
    @Published var dateViewModel = DateSelectionViewModel(startDate: Date(), endDate: Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date())
    
    
    init( isCollapsed: Bool = false) {
        self.isCollapsed = isCollapsed
    }
    
    func fetchAttendees() {
        NetworkService.fetchData(requestFor: "076c0cb9-c60e-48eb-a447-77e85b700d94", completion: handleResult)
    }
    
    func fetchRooms(for attendee: Attendee) {
        NetworkService.fetchData(requestFor: attendee.availableRoomsId, completion: handleRoomResult)
    }
    
    private func handleResult(result: Result<ChildrenResponse, Error>) {
        switch result {
        case .success(let childrenResponse):
            let attendees = childrenResponse.data.children
            print(attendees)
            DispatchQueue.main.async {
                self.arrAttendees = attendees
            }
        case .failure(let error):
            print("Error fetching attendees: \(error.localizedDescription)")
        }
    }
    
    private func handleRoomResult(result: Result<RoomsResponse, Error>) {
        switch result {
        case .success(let roomsResponse):
            let rooms = roomsResponse.data.bookingRooms
            DispatchQueue.main.async {
                // Handle the fetched rooms data
                print(rooms)
            }
        case .failure(let error):
            print("Error fetching rooms: \(error.localizedDescription)")
        }
    }
    
    
       func moveToFinalSummary() {
//           guard let objAttendee = selectedAttendeeItem , let objRoom = selectedRoomItem else {
//               return
//           }
           finalSummaryViewModel.setBookingData(
//               attendee: objAttendee,
//               room: objRoom,
               startDate: dateViewModel.startDate,
               endDate: dateViewModel.endDate,
               numberOfDays: dateViewModel.calculateTotalDays(),
               selectedDays: dateViewModel.selectedDays
           )
           
           
//           isFinalSummaryActive = true
       }
    
}

