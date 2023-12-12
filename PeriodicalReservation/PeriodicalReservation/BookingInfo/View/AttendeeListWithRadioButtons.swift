//
//  AttendeeListWithRadioButtons.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import Foundation
import SwiftUI

struct AttendeeListWithRadioButtons: View {
    @ObservedObject var viewModel: RecurringBookingViewModel
    
    var title: String?
    var body: some View {
        //VStack(alignment: .leading, spacing: 6)
        VStack(alignment: .leading ,spacing: 10) {
            
            HStack {
                Text(title ?? "")
                    .font(.headline)
                    .padding()
                
                Text(self.viewModel.selectedAttendeeItem?.fullName ?? "")
                    .font(.headline)
                
            }
            .onTapGesture {
                viewModel.isCollapsed.toggle()
            }
            
            
            List(viewModel.arrAttendees, id: \.fkey) { attendee in
                RadioButtonView(item: attendee.fullName, isSelected: attendee == viewModel.selectedAttendeeItem)
                    .onTapGesture {
                        viewModel.selectedAttendeeItem = attendee
                        viewModel.fetchRooms(for: attendee)
                        viewModel.selectedRoomItem = nil
                        viewModel.arrRoom.removeAll()
                        viewModel.isCollapsed.toggle()
                    }
            }
            
            .listStyle(PlainListStyle())
            .frame(height: viewModel.isCollapsed ? 0 : 133) // Adjust the collapsed and expanded heights
            
        }
    }
}



                                                        
                                                        
                                                        
