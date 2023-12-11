//
//  RoomListWithRadioButtons.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 12/12/23.
//

import Foundation
import SwiftUI

struct RoomListWithRadioButtons: View {
    @ObservedObject var viewModel: RecurringBookingViewModel
    
    var title: String?
    var body: some View {
        //VStack(alignment: .leading, spacing: 6)
        VStack(alignment: .leading ,spacing: 10) {
            
            HStack {
                Text(title ?? "")
                    .font(.headline)
                    .padding()
                
                Text(self.viewModel.selectedRoomItem?.roomName ?? "")
                    .font(.headline)
                
            }
            .onTapGesture {
                viewModel.isRoomCollapsed.toggle()
            }
            
            
            List(viewModel.arrRoom, id: \.roomFkey) { room in
                RadioButtonView(item: room.roomName, isSelected: room == viewModel.selectedRoomItem)
                    .onTapGesture {
                        viewModel.selectedRoomItem = room
                        viewModel.isRoomCollapsed.toggle()
                    }
            }
            
            .listStyle(PlainListStyle())
            .frame(height: viewModel.isRoomCollapsed ? 0 : 133) // Adjust the collapsed and expanded heights
            
        }
    }
}

