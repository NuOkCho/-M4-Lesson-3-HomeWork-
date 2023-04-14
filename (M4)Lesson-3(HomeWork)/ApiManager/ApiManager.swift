//
//  ApiManager.swift
//  (M4)Lesson-3(HomeWork)
//
//  Created by Ahmed Muvaza on 9/4/23.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    
    func getRequest(completion: @escaping (Result<DataModel, Error>) -> Void) {
//        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8a10cb9a44ed497196ccf0833200a4e9") else {return}
        guard let url = URL(string: "https://dummyjson.com/products") else {return}
        
        let request = URLResponse(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let model = try JSONdecoder().decode(dataModel.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

func postRequest (id: Int, title: String, completion: @escaping (Result<Int, Error>) -> Void) {
    guard let url = URL(string: "https://dummyjson.com/products/add") else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    let products = DataModel(products: [.init(id: id, title: title)], total: 1, skip: 1, limit: 1)
    request.httpBody = try? JSONDecoder().encode(products)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let response = response as? HTTPURLResponse else { return }
        
        if let error {
            completion(.failure(error))
            print(error)
        } else {
            completion(.success((response.statusCode)))
        }
    }
    task.resume()
}
