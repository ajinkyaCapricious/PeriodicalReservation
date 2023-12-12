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
                
                Text(createFinalString(input: viewModel.selectedRoomItem))
                    .font(.subheadline)
                
            }
            .onTapGesture {
                viewModel.isRoomCollapsed.toggle()
            }
            
            
            List(viewModel.arrRoom, id: \.roomFkey) { room in
                
                RadioButtonView(item: createFinalString(input: room), isSelected: room == viewModel.selectedRoomItem)
                    .onTapGesture {
                        viewModel.selectedRoomItem = room
                        viewModel.isRoomCollapsed.toggle()
                    }
            }
            .id(UUID()) //to forcely update the screen
            .listStyle(PlainListStyle())
            .frame(height: viewModel.isRoomCollapsed ? 0 : 133) // Adjust the collapsed and expanded heights
            
        }
    }
    
    private func createFinalString(input : Room?) -> String {
        guard let obj = input else {
            return ""
        }
        let finalString = "\(obj.roomName) - \(CommonUtlity.shared.convertToAmPm(timeString: obj.startTime) ?? "") - \(CommonUtlity.shared.convertToAmPm(timeString: obj.endTime) ?? "")"
        
        return finalString
    }
    
}



