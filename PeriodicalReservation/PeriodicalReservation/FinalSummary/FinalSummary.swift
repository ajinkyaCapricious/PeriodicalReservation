//
//  FinalSummary.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 12/12/23.
//

import SwiftUI

struct FinalSummary: View {
    
    @ObservedObject var finalSummaryViewModel: FinalSummaryViewModel


    
    var body: some View {
        var val = finalSummaryViewModel.selectedDays?.description ?? "nil"
        
        
        Text("Hello, World! \(val)")
    }
}

#Preview {
    FinalSummary(finalSummaryViewModel: FinalSummaryViewModel())
}
