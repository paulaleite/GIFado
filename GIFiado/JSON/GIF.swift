//
//  GIF.swift
//  GIFiado
//
//  Created by Paula Leite on 16/04/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import Foundation

struct GIFResponse: Decodable {
    var data: [GIFData]
}

struct GIFData: Decodable {
    var images: GIFImage
}

struct GIFImage: Decodable {
    var original: OriginalInfo
}

struct OriginalInfo: Decodable {
    var mp4: String
}
