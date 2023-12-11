//
//  RecurringBookingViewModel.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 08/12/23.
//

import Foundation


class RoomsViewModel: ObservableObject {
    
    @Published var tableData: [String] = ["Ajinkya ", "Ram", "Shiva"]
    @Published var selectedListItem: String?
    @Published var isCollapsed: Bool = true
    
    init(tableData: [String], isCollapsed: Bool = false) {
        self.isCollapsed = isCollapsed
        self.tableData = tableData
    }
}

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
                // Ensure that 'children' is an array before attempting to decode it
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
                    print("Invalid 'children' structure: Expected an array")
                }
            }
        case .failure(let error):
            print("Error fetching attendees: \(error.localizedDescription)")
        }
    }
    
}



class NetworkService {
    
    static func fetchData<T: Decodable>(urlRequest: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Network request error:", error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data received.")
                completion(.failure(NSError(domain: "Invalid data", code: 0, userInfo: nil)))
                return
            }
            //JSON decoding error: The data couldn’t be read because it isn’t in the correct format.
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                print("Decoded data:", decodedData)
                completion(.success(decodedData))
            } catch {
                print("JSON decoding error:", error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
    }
}

