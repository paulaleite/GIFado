//
//  GIF.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct ServerAnswer: Codable {
    let datas: [Datas]
    private enum CodingKeys: String, CodingKey {
        case datas = "data"
    }
}

struct Datas: Codable {
    let images: Image
    private enum CodingKeys: String, CodingKey {
        case images = "images"
    }
}

struct Image: Codable {
    let original: Original
}


struct Original: Codable {
    let url: String
}
