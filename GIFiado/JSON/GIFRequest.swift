//
//  GIFRequest.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import Foundation

var holiday: HolidayDetail?

func accessNameOfHoliday() -> String {
    
    guard let gifSearch = holiday?.name else { return "Error with name."}
    
    return gifSearch
}

enum GIFError: Error {
    case noDataAvailable
    case cannotProcessData
}

struct GIFRequest {
    let resourceURL: URL
    let API_KEY = "vN1Mf9zlf6Nle07kQYhr8alZMNm01c8A"
    
    init() {
        let gifSearchName = accessNameOfHoliday()
        
        
        let resoureString = "https://api.giphy.com/v1/gifs/search?api_key=\(API_KEY)&q=\(gifSearchName)&limit=1&offset=0&rating=G&lang=en"
        guard let resourseURL = URL(string: resoureString) else { fatalError() }
        
        self.resourceURL = resourseURL
        
    }
    
    func getHolidays(completion: @escaping(Result<[HolidayDetail], HolidayError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let holidayResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidayResponse.response.holidays
                completion(.success(holidayDetails))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
    
    
}
