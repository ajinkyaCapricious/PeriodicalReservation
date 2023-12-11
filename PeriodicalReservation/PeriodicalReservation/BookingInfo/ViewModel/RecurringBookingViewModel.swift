//
//  RecurringBookingViewModel.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import Foundation

class AttendeesViewModel: ObservableObject {
    
    @Published var attendees: [Attendee] = []
    @Published var selectedListItem: String?
    @Published var isCollapsed: Bool = false
    
    init( isCollapsed: Bool = false) {
        self.isCollapsed = isCollapsed
    }
    
    func fetchAttendees() {
        guard let url = URL(string: "https://api.myjson.online/v1/records/076c0cb9-c60e-48eb-a447-77e85b700d94") else {
            return
        }
        var request = URLRequest(url: url)
        request.addValue("66e627a5-cfff-4a8e-b80f-6f0e572bf476", forHTTPHeaderField: "x-collection-access-token")
        
        NetworkService.fetchData(urlRequest: request, completion: handleResult)
    }
    
//    private func handleResult(result: Result<[String: [Attendee]], Error>) {
//        switch result {
//        case .success(let data):
//            if let children = data["children"] {
//                DispatchQueue.main.async {
//                    self.attendees = children
//                }
//            }
//        case .failure(let error):
//            print("Error fetching attendees: \(error.localizedDescription)")
//        }
//    }
    private func handleResult(result: Result<[String: [Attendee]], Error>) {
        switch result {
        case .success(let data):
            if let children = data["children"] {
                if let jsonArray = children as? [[String: Any]] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: [])
                        let decodedData = try JSONDecoder().decode([Attendee].self, from: jsonData)
                        DispatchQueue.main.async {
                            self.attendees = decodedData
                        }
                    } catch {
                        print("Error decoding attendees: \(error.localizedDescription)")
                    }
                } else {
                    print("Invalid ")
                }
            }
        case .failure(let error):
            print("Error fetching attendees: \(error.localizedDescription)")
        }
    }
    
}

