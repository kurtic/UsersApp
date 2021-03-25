//
//  ApiService.swift
//  UsersApp
//
//  Created by Игорь on 22.03.2021.
//

import Foundation

class ApiService {
    
    
   static func request(urlString: String, completion: @escaping (Result<ServerResponse, Error>)->Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                do {
                    let users = try JSONDecoder().decode(ServerResponse.self, from: data)
                    completion(.success(users))
                } catch let jsonError {
                    print("Failed to decode json", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
