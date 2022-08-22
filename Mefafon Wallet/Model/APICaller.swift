//
//  APICaller.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/21/22.
//

import Foundation

class APICaller {
    
    static let shared = APICaller()
    
    let API = "https://fakestoreapi.com/products"
    
    func fetchData(userCompletionHandler: @escaping (Result<[Items], Error>) -> Void) {
        let url = URL(string: API)
        let sesson = URLSession(configuration: .default)
        let task = sesson.dataTask(with: url!) { data, response, error in
            if error != nil {
                print("An Error while connecting")
                userCompletionHandler(.failure(error!))
                return
        }
            if let safeData = data {
                let parsedData = self.parseJSON(safeData)
                if parsedData != nil {
                    userCompletionHandler(.success(parsedData!))
                }
            }
            
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> [Items]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([Items].self, from: data)
            return decodedData
        } catch {
            print("ERRRROR decoding data")
            print(error)
            return nil
        }
    }
}


//MARK: - Models
struct Items: Codable {
    let description: String
    let image: String
}

