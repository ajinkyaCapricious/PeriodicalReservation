//
//  NetworkService.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 11/12/23.
//

import Foundation


struct AppConfiguration {
    static let apiBaseURL = "https://api.myjson.online/v1/records/"
    static let accessToken = "66e627a5-cfff-4a8e-b80f-6f0e572bf476"
}

class NetworkService {
    
    static func fetchData<T: Decodable>(requestFor: String, completion: @escaping (Result<T, Error>) -> Void) {
        //Base URL + Request
        guard let url = URL(string: "\(AppConfiguration.apiBaseURL)\(requestFor)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        //Access Token
        var request = URLRequest(url: url)
        request.addValue(AppConfiguration.accessToken, forHTTPHeaderField: "x-collection-access-token")
       
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("Received data:", String(data: data! , encoding: .utf8) ?? "Unable to convert data to string")

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


