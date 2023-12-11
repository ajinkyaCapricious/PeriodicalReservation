//
//  RadioButtonView.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 11/12/23.
//

import Foundation
import SwiftUI

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

