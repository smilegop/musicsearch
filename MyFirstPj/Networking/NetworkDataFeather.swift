//
//  NetworkDataFeather.swift
//  MyFirstPj
//
//  Created by smilegop on 18.02.2021.
//

import Foundation

class NetworkDataFeather {
  
    let networkService = NetworkService()
    
    func featchTraks(urlString: String, response: @escaping (SearchResponse?)-> Void) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                    response(tracks)
                } catch let jsonError {
                    print("failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received data: \(error.localizedDescription) ")
                response(nil)
            }
        }
    }
}
