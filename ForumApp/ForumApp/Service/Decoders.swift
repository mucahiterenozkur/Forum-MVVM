//
//  Decoders.swift
//  ForumApp
//
//  Created by Mücahit Eren Özkur on 4.04.2022.
//

import Foundation

public enum Decoders {
    
    static let dateDecoder: JSONDecoder = {
       let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
}
