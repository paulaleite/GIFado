//
//  HolidayRequest.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import Foundation

enum HolidayError: Error {
    case noDataAvailable
    case cannotProcessData
}

struct HolidayRequest {
    let resourceURL: URL
    let API_KEY = "f6be48394ce929a7edfaffc108f4e5395dcdb6fe"
    
    init(countryCode: String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        
        let resoureString = "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
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
