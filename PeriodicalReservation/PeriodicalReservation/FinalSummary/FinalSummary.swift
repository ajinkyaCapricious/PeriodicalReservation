//
//  FinalSummary.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 12/12/23.
//

import SwiftUI

struct FinalSummary: View {
    @ObservedObject var finalSummaryViewModel: FinalSummaryViewModel
    @Environment(\.presentationMode) var presentationMode
    

    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text("New Recurring Booking")
                .font(.system(size: 23))
                .bold()
                .padding(.top, 20)
                .padding(.leading, 20) // Move the heading to the left
            
            HStack {
                Text("Summary")
                    .font(.headline)
                    .padding(.top, 10)
                    .padding(.leading, 20)
                Spacer()
            }
            .padding(.top , 20)
            
            // AttendeeName HStack with border
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(.blue)
                        .frame(width: 25, height: 25)
                    Text(finalSummaryViewModel.attendee?.fullName ?? "No Name")
                        .font(.headline)
                }
            }
            .frame(
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 1)
                    .stroke(Color.black, lineWidth: 2)
            )
            
            
            
            
            Text(finalSummaryViewModel.room?.roomName ?? "No Name")
                .font(.headline)
                .bold()
                .padding(.top, 10)
                .padding(.leading, 20)
            
            Text("From: \(CommonUtlity.shared.formattedDate(finalSummaryViewModel.startDate ?? Date()))")
                .padding(.leading, 20)
                .padding(.top, 5)
            
            Text("Every: \(finalSummaryViewModel.selectedDays?.joined(separator: ", ") ?? "Not selected Yet")")
                .padding(.leading, 20)
                .padding(.top, 5)
            
            Text("Ends: \(CommonUtlity.shared.formattedDate(finalSummaryViewModel.endDate ?? Date()))")
                .padding(.leading, 20)
                .padding(.top, 5)
            
            Text("You are booking \(finalSummaryViewModel.numberOfDays ?? 0) days")
                .padding(.top, 20)
                .padding(.leading, 20)
            
            Text("Booking reference number:")
                .font(.headline)
                .padding(.top, 20)
                .padding(.leading, 20)
            
            Text(UIDevice.current.identifierForVendor?.uuidString ?? "genrating code...")
                .padding(.leading, 20)
            
            
            Spacer()
            
            Button(action: {
                
                presentationMode.wrappedValue.dismiss()

                       }) {
                           Text("change Booking")
                               .foregroundColor(.blue)
                               .padding()
                               .background(Color.white)
                               .padding(.horizontal, 20)
                               .border(.blue)
                       }
                       
                       Button(action: {
                           UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                               exit(0)
                                           }
                       }) {
                           Text("Done")
                               .foregroundColor(.white)
                               .padding()
                               .background(Color.blue)
                               .cornerRadius(8)
                               .padding(.horizontal, 20)
                               
                       }
                       .padding(.bottom, 20)
            
        }
        .padding(.horizontal, 20)
        
    }
}

struct FinalSummary_Previews: PreviewProvider {
    static var previews: some View {
        FinalSummary(finalSummaryViewModel: FinalSummaryViewModel())
    }
}
