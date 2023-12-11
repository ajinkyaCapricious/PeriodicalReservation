//
//  NetworkService.swift
//  PeriodicalReservation
//
//  Created by Ajinkya Adole on 11/12/23.
//

import Foundation


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

