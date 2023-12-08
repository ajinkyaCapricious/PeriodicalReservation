//
//  ListWithRadioButtons.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import Foundation

import SwiftUI

struct ListWithRadioButtons: View {
    @ObservedObject var viewModel: ViewModel
    
    var title: String?
    var body: some View {
        //VStack(alignment: .leading, spacing: 6)
        VStack(alignment: .leading ,spacing: 10) {
            
            HStack {
                Text(title ?? "")
                    .font(.headline)
                    .padding()
                
                Text(self.viewModel.selectedListItem ?? "")
                    .font(.headline)
                    
            }
            .onTapGesture {
                viewModel.isCollapsed.toggle()
            }
            
            List(viewModel.tableData, id: \.self) { item in
                RadioButtonView(item: item, isSelected: item == viewModel.selectedListItem)
                    .onTapGesture {
                        viewModel.selectedListItem = item
                        viewModel.isCollapsed.toggle()
                    }
            }
            .listStyle(PlainListStyle())
            .frame(height: viewModel.isCollapsed ? 0 : 133) // Adjust the collapsed and expanded heights
            
        }
    }
}




struct RadioButtonView: View {
    let item: String
    let isSelected: Bool

    var body: some View {
        HStack {
            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                .tint(.black)
            Text(item)
                .padding(.leading, 5)
        }
        .foregroundColor(isSelected ? .blue : .black)
    }
}
