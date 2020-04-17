//
//  GIFRequest.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import Foundation

enum GIFError: Error {
    case noDataAvailable
    case cannotProcessData
}

struct GIFRequest {
    let API_KEY = "vN1Mf9zlf6Nle07kQYhr8alZMNm01c8A"
    
    init () {
        
    }
    
    func getGifs(holidayName: String, completion: @escaping(Result<String, GIFError>) -> Void) {
        
        let resourceString = "https://api.giphy.com/v1/gifs/search?api_key=\(API_KEY)&q=\(holidayName)&limit=1&offset=0&rating=G&lang=en"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let gifResponse = try decoder.decode(ServerAnswer.self, from: jsonData)
//                print(gifResponse.datas[0].images.original.url)
                completion(.success(gifResponse.datas[0].images.original.url))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
    
    
}
