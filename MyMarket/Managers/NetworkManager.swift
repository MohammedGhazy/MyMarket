//
//  NetworkManager.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 6/10/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
    let baseURL = "https://fakestoreapi.com"
    let cache   = NSCache<NSString , UIImage>()
    
    static let shared = NetworkManager()
    private init(){}
    
    func getProduct(for complete: @escaping (Result<[ProductItem], ErrorMessage>) -> Void) {
        
        let endPoint =  "\(baseURL)/products"
        
        guard let url = URL(string: endPoint) else {
            complete(.failure(.invalidData))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error{
                complete(.failure(.internetError))
                return
            }
            
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else{
                complete(.failure(.serverError))
                return
            }
            
            guard let data = data else{
                complete(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let products = try decoder.decode([ProductItem].self, from: data)
                let categoryArray = products.filter({$0.category.rawValue == "electronics"})
                complete(.success(categoryArray))
            }catch{
                complete(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
