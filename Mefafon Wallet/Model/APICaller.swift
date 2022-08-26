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
    let SecondAPI = "https://api.openweathermap.org/data/2.5/weather?appid=a1e151d622afdce5cfb47b1135ccae7c&units=metric"
    let thirdAAPI = "https://dummyjson.com/products"
    
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
    
    func fetchState(userCompletionHandler: @escaping (Result<State, Error>) -> Void) {
        let url = URL(string: SecondAPI)
        
        let sesson = URLSession(configuration: .default)
        let task = sesson.dataTask(with: url!) { data, response, error in
            if error != nil {
                print("An Error while connecting")
                userCompletionHandler(.failure(error!))
                return
        }
            if let safeData = data {
                let parsedData = self.parseJSONS(safeData)
                if parsedData != nil {
                    userCompletionHandler(.success(parsedData!))
                }
            }
            
        }
        task.resume()
    }
    
    func parseJSONS(_ data: Data) -> State? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(State.self, from: data)
            return decodedData
        } catch {
            print("ERRRROR decoding data")
            print(error)
            return nil
        }
    }
    
    
    func fetchProducts(userCompletionHandler: @escaping (Result<[Products], Error>) -> Void) {
        let url = URL(string: thirdAAPI)
        
        let sesson = URLSession(configuration: .default)
        let task = sesson.dataTask(with: url!) { data, response, error in
            if error != nil {
                print("An Error while connecting")
                userCompletionHandler(.failure(error!))
                return
        }
            if let safeData = data {
                let parsedData = self.parseProductsJSON(safeData)
                if parsedData != nil {
                    userCompletionHandler(.success(parsedData!))
                }
            }
            
        }
        task.resume()
    }
    
    func parseProductsJSON(_ data: Data) -> [Products]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(DummyJSON.self, from: data)
            return decodedData.products
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
    let price: Float
//    let count: Int
    let title: String
}

struct State: Codable {
    let cod: String
}



struct DummyJSON: Codable{
    let products: [Products]
}

struct Products: Codable {
    let title: String
    let price: Int
    let discountPercentage: Float
    let rating: Float
    let brand: String
    let thumbnail: String
}

